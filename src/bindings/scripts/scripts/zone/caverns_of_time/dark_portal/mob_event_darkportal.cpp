/* Copyright (C) 2006 - 2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "precompiled.h"
#include "precompiled.h"
#include "def_the_dark_portal.h"
#include "WorldPacket.h"

#define SAY_ENTER               -1269020                    //where does this belong?
#define SAY_INTRO               -1269021
#define SAY_WEAK75              -1269022
#define SAY_WEAK50              -1269023
#define SAY_WEAK25              -1269024
#define SAY_DEATH               -1269025
#define SAY_WIN                 -1269026
#define SAY_ORCS_ENTER          -1269027
#define SAY_ORCS_ANSWER         -1269028

#define POS_X1    -1980.069214
#define POS_Y1    7167.529785
#define POS_Z1    22.361124
 
#define POS_X2    -1958.137085
#define POS_Y2    7123.06054
#define POS_Z2    20.871408
 
#define POS_X3    -1980.075928
#define POS_Y3    7067.254883
#define POS_Z3    21.954077
 
#define POS_X4    -2035.463257
#define POS_Y4    7071.978027
#define POS_Z4    22.541857

struct TRINITY_DLL_DECL mob_medivhAI : public ScriptedAI
{
    mob_medivhAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
    }
 
    ScriptedInstance *pInstance;
 
    uint32 Wave_Timer;
    uint32 Phase;
    uint32 Wave;
    uint64 Portal_GUID;
    uint32 Control;
    bool Has75hp;
    bool Has50hp;
    bool Has25hp;
    bool Finished;
 
    void Reset()
    {
        //Portal = NULL;
        Wave_Timer = 0;
        Phase = 0;
        Control = rand()%4;
        Has75hp = false;
        Has50hp = false;
        Has25hp = false;
        Finished = false;
        Wave = 0;

        if (pInstance) 
        {
            //pInstance->SetData(DATA_WAVE, 0); 
            pInstance->SetData(DATA_MEDIVHDEATH, 0); 
            pInstance->SetData(DATA_SHIELDPERCENT, 100);
        }

        m_creature->SetUInt32Value(UNIT_NPC_FLAGS,0);
        m_creature->CastSpell(m_creature,31556,false);
    }

    void Aggro(Unit *who){}
 
    /** Begin event when player is 10m arround Medivh **/
    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;
 
        if(who->isAlive() && (who->GetTypeId() == TYPEID_PLAYER))
        {
            if (Phase == 0 && m_creature->IsWithinDistInMap(who, 20.0f)){
			    DoScriptText(SAY_INTRO, m_creature);
                //Show Interface
                UpdateWorldState(2541, 1);
                //Set up percent...
                UpdateWorldState(2540, 100);
                //... and waves
                UpdateWorldState(2784, Wave);
                Phase = 1;
            }
        }
    }
 
    /** This prevents portal stacking on the same position but it is not totally random :/ **/
    void SummonPortalRandomPosition(uint32 cas)
    {
        Creature* Portal;
        switch(cas)
        {
        case 0:
            Portal = m_creature->SummonCreature(17838, POS_X1, POS_Y1, POS_Z1, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
            Control = rand()%3;
            if (Control < 1)
                Control++;
            break;
        case 1:
            Portal = m_creature->SummonCreature(17838, POS_X2, POS_Y2, POS_Z2, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
            Control = rand()%3;
            if (Control > 0)
                Control++;
            break;
        case 2:
            Portal = m_creature->SummonCreature(17838, POS_X3, POS_Y3, POS_Z3, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
            Control = rand()%3;
            if (Control > 1)
                Control++;
            break;
        case 3:
            Portal = m_creature->SummonCreature(17838, POS_X4, POS_Y4, POS_Z4, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
            Control = rand()%3;
            break;
        }
        Portal_GUID = Portal->GetGUID();
    }
  
    void JustDied(Unit* Killer)
    {
        if (pInstance) {
            pInstance->SetData(DATA_MEDIVHDEATH, 1);
            pInstance->SetData(DATA_SHIELDPERCENT, 0);
        }

            UpdateWorldState(2541, 0);

        m_creature->Yell(SAY_DEATH, LANG_UNIVERSAL, 0);
    }
    void UpdateWorldState(uint32 field, uint32 value)
    {
        Map * map = m_creature->GetMap();
        if(!map->IsDungeon()) return;

        WorldPacket data(SMSG_UPDATE_WORLD_STATE, 8);

        data << field;
        data << value;

        ((InstanceMap*)map)->SendToPlayers(&data);
    }
    void UpdateAI(const uint32 diff)
    {
        if (Phase == 0 || pInstance->GetData(DATA_MEDIVHDEATH) == 1)
            return;

        if (Phase == 1)
        {
            Unit* Portal_control;
            Portal_control =  Unit::GetUnit((*m_creature),Portal_GUID);
            switch(Wave){
                // 1st wave
                case 0:
                    if(Wave_Timer < diff)
                    {
                        Wave++;
                        SummonPortalRandomPosition(Control);
                        Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                    }else Wave_Timer -= diff;
                    break;
                // 1st wave
                case 1: case 2: case 3: case 4:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                         }else Wave_Timer -= diff;
                    }
                    break;
                // Spawn Chrono Lord Deja
                case 5:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 140000; //was 240.000
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // 2nd wave, first portal after Chrono Lord Deja's death shouldn't be spawned instant
                case 6:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // 2nd wave, all other waves should
                case 7: case 8: case 9: case 10:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {        
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // Spawn Temporus
                case 11:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 140000; //was 220.000
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // 3rd wave, first portal after Temporus's death shouldn't be spawned instant
                case 12:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // 3rd wave, all other should
                case 13: case 14: case 15: case 16:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            Wave_Timer = 2000;
                            UpdateWorldState(2784, Wave);
                        }else Wave_Timer -= diff;
                    }
                    break;
                // Spawn Aeonus
                case 17:
                    if(!Portal_control || (Portal_control && Portal_control->isDead()))
                    {
                        if (Wave_Timer < diff)
                        {
                            Wave++;
                            SummonPortalRandomPosition(Control);
                            UpdateWorldState(2784, Wave);
                            Wave_Timer = 100000;
                            Phase = 2;
                        }else Wave_Timer -= diff;
                    }
                    break;
            }
        }else{
            if(pInstance->GetData(DATA_AEONUSDEATH) == 1)
            {
                if(!Finished){
                    DoScriptText(SAY_WIN, m_creature);
                    //m_creature->RemoveAllAuras();
                    m_creature->CombatStop();
                    m_creature->SetUInt32Value(UNIT_NPC_FLAGS,3); // Can finished quest
                    m_creature->RemoveAurasDueToSpell(31556);
                    Finished = true;
                }
            }
        }

        /** Medivh yells every 25% **/
        if (!Has75hp){
            if ( pInstance->GetData(DATA_SHIELDPERCENT) <= 75 ){
                DoScriptText(SAY_WEAK75, m_creature);
                Has75hp = true;
            }
        }else if(!Has50hp){
            if ( pInstance->GetData(DATA_SHIELDPERCENT) <= 50 ){
                DoScriptText(SAY_WEAK50, m_creature);
                Has50hp = true;
            }
        }else if(!Has25hp){
            if ( pInstance->GetData(DATA_SHIELDPERCENT) <= 25 ){
                DoScriptText(SAY_WEAK25, m_creature);
                Has25hp = true;
            }
        }
    }
}; 
CreatureAI* GetAI_mob_medivh(Creature *_Creature)
{    
    return new mob_medivhAI (_Creature);
};



//Mainly visual effects around Medivh
//here mostly placeholders, because I can't find spells :-/

struct TRINITY_DLL_DECL mob_dark_portal_controllers : public ScriptedAI
{
    mob_dark_portal_controllers(Creature *c) : ScriptedAI(c) 
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
    }
 
    ScriptedInstance* pInstance;
 
    uint32 Reset_Timer;
 
    void Reset()
    {
        uint32 CreatureID = m_creature->GetEntry();

        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

        switch(CreatureID)
        {
        //Dark Portal Ground Rune Invisible Stalker (and Respawner)
        case 18562:
            Reset_Timer = 300000;
            m_creature->CastSpell(m_creature,32570,true);
            break;
        //Dark Portal Black Crystal Invisible Stalker
        case 18553:
            m_creature->CastSpell(m_creature,32563,true);
            break;
        //Dark Portal Emitter Invisible Stalker
        case 18582:
            //m_creature->CastSpell(m_creature,0,true);
            break;
        //Dark Portal Beam Invisible Stalker
        case 18555:
            //m_creature->CastSpell(m_creature,0,true);
            break;
        }
    }
    
    void Aggro(Unit *who)
    {
    }
 
    void UpdateAI(const uint32 diff)
    {
        /* This needs to be two seperate creatures, as the respawner will imo be spawned upon
        Medivh's death to prevent cheating or something ;) Dunno know ;)
        uint32 CreatureID = m_creature->GetEntry();

        switch(CreatureID)
        {
            //Dark Portal Ground Rune Invisible Stalker (and Respawner)
            case 18562:
                if (pInstance->GetData(DATA_MEDIVHDEATH) == 1)
                {
                if (Reset_Timer < diff)
                {
                    Creature *pMedivh = (Creature*)(Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MEDIVH)));
                    if(pMedivh)
                    {
                        pMedivh->Respawn();
                        pMedivh->AI()->EnterEvadeMode();
                        if (pInstance)
                            pInstance->SetData(DATA_MEDIVHDEATH, 0);
                    }
     
                    EnterEvadeMode();
                    Reset_Timer = 300000;
                }else Reset_Timer -= diff;
                }
                break;
        }*/
        
    }
};
 
CreatureAI* GetAI_mob_dark_portal_controllers(Creature *_Creature)
{
    return new mob_dark_portal_controllers (_Creature);
};


struct TRINITY_DLL_DECL mob_time_riftAI : public ScriptedAI
{
    mob_time_riftAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
    }
 
    ScriptedInstance *pInstance;
    uint32 Add_Spawn_Timer;
    bool RiftGuardianSpawned;
    uint32 RiftGuardSpawn_Timer;
    uint32 Control;
    Creature *Guardian;
    Creature* Infinite_Spawn;
 
    void Reset()
    {
        Guardian = NULL;
        Add_Spawn_Timer = 15000+rand()%5000;
        RiftGuardSpawn_Timer = 15000;
        RiftGuardianSpawned = false;
        Control = 0;
    }

    void Aggro(Unit *who){}
    
    void AttackStart(Unit* who) {}

    void MoveInLineOfSight(Unit* who) {}
 
    void SummonInfiniteSpawn(uint32 cas)
    {
        Creature *pMedivh = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MEDIVH)));
 
        //During Wave 1 to 6 (including the Boss Chrono Lord Deja) we will have the following repeating cycle:
        //1 Assassin, 3 Whelps, 1 Chronomancer
        if(((mob_medivhAI*)pMedivh->AI())->Wave <= 6) {
            switch(cas)
            {
            case 0:
                //Infinite Assassin
                Infinite_Spawn = DoSpawnCreature(17835, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Control = 1;
                break;
            case 1:
                //3 Infinite Whelp
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 2;
                break;
            case 2:
                //Infinite Chronomancer
                Infinite_Spawn = DoSpawnCreature(17892, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 0;
                break;
            }
        }
        //During Wave 7 to 12 (including the Boss Temporus) we will have the following repeating cycle:
        //1 Executioner, 1 Chronomancer, 3 Whelps, 1 Assassin
        if((((mob_medivhAI*)pMedivh->AI())->Wave >= 7) && (((mob_medivhAI*)pMedivh->AI())->Wave <= 12 )) {
            switch(cas)
            {
            case 0:
                //Infinite Executioner
                Infinite_Spawn = DoSpawnCreature(18994, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 1;
                break;
            case 1:
                //Infinite Chronomancer
                Infinite_Spawn = DoSpawnCreature(17892, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 2;
                break;
            case 2:
                //3 Infinite Whelp
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Infinite_Spawn = DoSpawnCreature(21818, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 3;
                break;
            case 3:
                //Infinite Assassin
                Infinite_Spawn = DoSpawnCreature(17835, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 0;
                break;
            }
        }
        //During Wave 13 to 17 (NOT at Wave 18! The Boss Aeonus will spawn alone)
        //we will have the following repeating cycle:
        //1 Executioner, 1 Vanquisher, 1 Chronomancer, 1 Assassin
        if((((mob_medivhAI*)pMedivh->AI())->Wave >= 13) && (((mob_medivhAI*)pMedivh->AI())->Wave <= 17 )) {
            switch(cas)
            {
            case 0:
                //Infinite Executioner
                Infinite_Spawn = DoSpawnCreature(18994, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 1;
                break;
            case 1:
                //Infinite Vanquisher
                Infinite_Spawn = DoSpawnCreature(18995, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 2;
                break;
            case 2:
                //Infinite Chronomancer
                Infinite_Spawn = DoSpawnCreature(17892, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 3;
                break;
            case 3:
                //Infinite Assassin
                Infinite_Spawn = DoSpawnCreature(17835, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10000);
                ((CreatureAI*)Infinite_Spawn->AI())->AttackStart(pMedivh);
                Infinite_Spawn->AddThreat(pMedivh,0.0f);
                Control = 0;
                break;
            }
        }
    }
 
    void SummonRandomGuardian()
    {
        Creature *pMedivh = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MEDIVH)));

        // At Wave 6 Chrono Lord Deja will spawn instead of a Rift Lord or Rift Keeper
        if(((mob_medivhAI*)pMedivh->AI())->Wave == 6) {
            Guardian = DoSpawnCreature(17879, rand()%5, rand()%5, 0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1200000);
            m_creature->CastSpell(Guardian,31387,false);
			((CreatureAI*)Guardian->AI())->AttackStart(pMedivh);
            return;
        }

        // At Wave 12 Temporus will spawn instead of a Rift Lord or Rift Keeper
        if(((mob_medivhAI*)pMedivh->AI())->Wave == 12) {
            Guardian = DoSpawnCreature(17880, rand()%5, rand()%5, 0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1200000);
            m_creature->CastSpell(Guardian,31387,false);
			((CreatureAI*)Guardian->AI())->AttackStart(pMedivh);
            return;
        }

        // At Wave 18 Aeonus will spawn instead of a Rift Lord or Rift Keeper, alone and start attacking Medivh
        if(((mob_medivhAI*)pMedivh->AI())->Wave == 18) {
            Guardian = DoSpawnCreature(17881, rand()%5, rand()%5, 0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1200000);
            ((CreatureAI*)Guardian->AI())->AttackStart(pMedivh);
            Guardian->getThreatManager().addThreat(pMedivh,0.0f);
            return;
        }

        switch(rand()%2)
        {
        case 0:
            //Rift Keeper
            Guardian = DoSpawnCreature(21104, rand()%5, rand()%5, 0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1200000);
            m_creature->CastSpell(Guardian,31387,false);
            break;
        case 1:
            //Rift Lord
            Guardian = DoSpawnCreature(17839, rand()%5, rand()%5, 0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 1200000);
            m_creature->CastSpell(Guardian,31387,false);
            break;
        }
    }
 
    void UpdateAI(const uint32 diff)
    {
        /** Despawn if Medivh dies **/
        if(pInstance->GetData(DATA_MEDIVHDEATH) == 1)
        {
            if(Guardian)
            {
                Guardian->DealDamage(Guardian, Guardian->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                Guardian->RemoveCorpse();
            }
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            m_creature->RemoveCorpse();
            return;
        }
 
        if(!RiftGuardianSpawned) {
        if(RiftGuardSpawn_Timer < diff)
        {
            SummonRandomGuardian();
            RiftGuardianSpawned = true;
        }else RiftGuardSpawn_Timer -= diff;
        }
 
        if(Add_Spawn_Timer < diff)
        {
            SummonInfiniteSpawn(Control);
            Add_Spawn_Timer = 15000;
        }else Add_Spawn_Timer -= diff;
 
        if(Guardian) {
            if(!Guardian->isAlive()) {
                m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                m_creature->RemoveCorpse();
            }
        }
    }
}; 

CreatureAI* GetAI_mob_time_rift(Creature *_Creature)
{
    return new mob_time_riftAI (_Creature);
};


#define CORRUPT_MEDIVH            31326

//Infinite Assasin
#define BACKSTAB                7159
#define KIDNEY_SHOT                30822
#define RUPTURE                    15583 // 14874
#define SINISTER_STRIKE            15667 // 14873

//Infinite Chronomancer
#define ARCANE_BOLT                15230 // 15124
#define ARCANE_EXPLOSION        33860 // 33623
#define FROST_NOVA                15531 // 15063
#define FROST_BOLT_CHRONO        15497 // 12675 

//Infinite Executioner
#define CLEAVE                    15496
#define HAMSTRING                9080
#define OVERPOWER                37321 // 17198
#define STRIKE                    34920 // 15580

//Rift Keeper
#define BLAST_WAVE                38536 // 36278 
#define CURSE_OF_VULNERABILITY    36276
#define ENRAGE                    8269
#define FEAR                    12542
#define FROST_BOLT_KEEPER        38534 // 36279
#define POLYMORPH                13323
#define PYROBLAST                38535 // 36277
#define SHADOW_BOLT_VALLEY        36275

//Rift Lord
//ENRAGE
//HAMSTRING
#define KNOCKDOWN                11428
#define MORTAL_STRIKE            35054 // 15708
#define SUNDER_ARMOR            16145
#define THUNDERCLAP                38537 // 36214

struct TRINITY_DLL_DECL mobs_infinite_adds : public ScriptedAI
{
    mobs_infinite_adds(Creature *c) : ScriptedAI(c) 
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
    }

    bool MayNotCastCorrupt;
    bool IsChanneling;

    // "Corrupt Medivh" Timer
    uint32 Corrupt_Timer;
    
    // Infinite Assasin Timers
    uint32 Assasin_Backstab_Timer;
    uint32 Assasin_KidneyShot_Timer;
    uint32 Assasin_Rupture_Timer;
    uint32 Assasin_SinisterStrike_Timer;

    // Infinite Chronomancer Timers
    uint32 Chrono_ArcaneBolt_Timer;
    uint32 Chrono_ArcaneExplosion_Timer;
    uint32 Chrono_FrostNova_Timer;
    uint32 Chrono_FrostBolt_Timer;

    // Infinite Executioner Timers
    uint32 Executioner_Cleave_Timer;
    uint32 Executioner_Hamstring_Timer;
    uint32 Executioner_Overpower_Timer;
    uint32 Executioner_Strike_Timer;

    // Rift Keeper Type + Timers
    uint32 Keeper_Type;
    uint32 Keeper_BlastWave_Timer;
    uint32 Keeper_Curse_Timer;
    uint32 Keeper_Enrage_Timer;
    uint32 Keeper_Fear_Timer;
    uint32 Keeper_FrostBolt_Timer;
    uint32 Keeper_Polymorph_Timer;
    uint32 Keeper_Pyroblast_Timer;
    uint32 Keeper_ShadowBoltValley_Timer;

    // Rift Lord Timers
    uint32 Lord_Enrage_Timer;
    uint32 Lord_Hamstring_Timer;
    uint32 Lord_Knockdown_Timer;
    uint32 Lord_MortalStrike_Timer;
    uint32 Lord_SunderArmor_Timer;
    uint32 Lord_Thunderclap_Timer;
     
    ScriptedInstance* pInstance;
 
    void Reset()
    {
        MayNotCastCorrupt = false;
        IsChanneling = false;
        InCombat = false;
        // Corrupt Medivh
        Corrupt_Timer = 3000;

        // Infinite Assasin Timers
        Assasin_Backstab_Timer = 9999999; //dunno know
        Assasin_KidneyShot_Timer = 5000;
        Assasin_Rupture_Timer = 3000;
        Assasin_SinisterStrike_Timer = 1000;

        // Infinite Chronomancer Timers
        Chrono_ArcaneBolt_Timer = 5000;
        Chrono_ArcaneExplosion_Timer = 6000+rand()%2000;
        Chrono_FrostNova_Timer = 1000;
        Chrono_FrostBolt_Timer = 2000;

        // Infinite Executioner Timers
        Executioner_Cleave_Timer = 9000;
        Executioner_Hamstring_Timer = 5000;
        Executioner_Overpower_Timer = 7000;
        Executioner_Strike_Timer = 10000;

        // Rift Keeper Type + Timers
        Keeper_Type = rand()%2;
        Keeper_BlastWave_Timer = 9000+rand()%6000;
        Keeper_Curse_Timer = 20000; //dunno know
        Keeper_Enrage_Timer = 120000;
        Keeper_Fear_Timer = 10000;
        Keeper_FrostBolt_Timer = 1000;
        Keeper_Polymorph_Timer = 10000;
        Keeper_Pyroblast_Timer = 4000+rand()%6000;
        Keeper_ShadowBoltValley_Timer = 5000+rand()%2000;

        // Rift Lord Timers
        Lord_Enrage_Timer = 120000;
        Lord_Hamstring_Timer = 30000;
        Lord_Knockdown_Timer = 35000;
        Lord_MortalStrike_Timer = 15000;
        Lord_SunderArmor_Timer = 1000;
        Lord_Thunderclap_Timer = 10000;

    }
    
    void Aggro(Unit *who)
    {
    }
    
    void UpdateWorldState(uint32 field, uint32 value)
    {
        Map * map = m_creature->GetMap();
        if(!map->IsDungeon()) return;

        WorldPacket data(SMSG_UPDATE_WORLD_STATE, 8);

        data << field;
        data << value;

        ((InstanceMap*)map)->SendToPlayers(&data);
    }
 
    void UpdateAI(const uint32 diff)
    {
        Creature *pMedivh = (Creature*)(Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MEDIVH)));
        
        uint32 CreatureID = m_creature->GetEntry();

        // As soon as we reach near Medivh, corrupt him
        if(pMedivh && m_creature->IsWithinDistInMap(pMedivh, 10.0f) && !MayNotCastCorrupt) {
            if (!(CreatureID == 17839 || CreatureID == 21104))
            {
                DoCast(pMedivh, CORRUPT_MEDIVH);
                MayNotCastCorrupt = true;
                IsChanneling = true;
            }
        }


        // If we channel corrupt on Medivh, lower Shield by 1% every 3 seconds
        if(IsChanneling)
        {
            if(Corrupt_Timer < diff)
            {
                if(pInstance)
                {
                    uint32 ShieldPercent = pInstance->GetData(DATA_SHIELDPERCENT);
                    pInstance->SetData(DATA_SHIELDPERCENT, ShieldPercent-1);
                    UpdateWorldState(2540, ShieldPercent-1);
                    if(pMedivh && !pMedivh->isDead() && ShieldPercent <= 0)
                        m_creature->DealDamage(pMedivh, pMedivh->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

                }
                Corrupt_Timer = 3000;
            }else Corrupt_Timer -= diff;
        }

        if(pInstance->GetData(DATA_MEDIVHDEATH) == 1) {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            m_creature->RemoveCorpse();
            return;
        }

        //Return since we have no target
        if (!UpdateVictim())
            return;

        if(m_creature->getVictim()->GetTypeId() == TYPEID_PLAYER){
        //AI's for trash mobs / mini-elite bosses
        switch (CreatureID)
        {
        //Rift Keeper
        case 21104:
            if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 20)
            {
                DoCast(m_creature, ENRAGE);
                Keeper_Enrage_Timer = 120000;
            }else Keeper_Enrage_Timer -= diff;

            if(Keeper_Type == 0) {
                if(Keeper_BlastWave_Timer < diff)
                {
                    DoCast(m_creature->getVictim(), BLAST_WAVE);
                    Keeper_BlastWave_Timer = 9999999;
                }else Keeper_BlastWave_Timer -= diff;

                if(Keeper_FrostBolt_Timer < diff)
                {
                    Unit *target = SelectUnit(SELECT_TARGET_RANDOM, 0);
                    DoCast(target, FROST_BOLT_KEEPER);
                    Keeper_FrostBolt_Timer = 2000+rand()%2000;
                }else Keeper_FrostBolt_Timer -= diff;

                if(Keeper_Polymorph_Timer < diff)
                {
                    Unit *target = SelectUnit(SELECT_TARGET_TOPAGGRO, 1);
                    DoCast(target, POLYMORPH);
                    Keeper_Polymorph_Timer = 9999999;
                }else Keeper_Polymorph_Timer -= diff;

                if(Keeper_Pyroblast_Timer < diff)
                {
                    Unit *target = SelectUnit(SELECT_TARGET_RANDOM, 0);
                    DoCast(target, PYROBLAST);
                    Keeper_Pyroblast_Timer = 15000;
                }else Keeper_Pyroblast_Timer -= diff;
            } else {
                if(Keeper_ShadowBoltValley_Timer < diff)
                {
                    DoCast(m_creature->getVictim(), SHADOW_BOLT_VALLEY);
                    Keeper_ShadowBoltValley_Timer = 20000;
                }else Keeper_ShadowBoltValley_Timer -= diff;

                if(Keeper_Curse_Timer < diff)
                {
                    Unit *target = SelectUnit(SELECT_TARGET_RANDOM, 0);
                    DoCast(target, CURSE_OF_VULNERABILITY);
                    Keeper_Curse_Timer = 9999999;
                }else Keeper_Curse_Timer -= diff;

                if(Keeper_Fear_Timer < diff)
                {
                    Unit *target = SelectUnit(SELECT_TARGET_TOPAGGRO, 1);
                    DoCast(target, FEAR);
                    Keeper_Fear_Timer = 9999999;
                }else Keeper_Fear_Timer -= diff;
            }
            break;
        //Rift Lord
        case 17839:
            if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 20)
            {
                DoCast(m_creature, ENRAGE);
                Lord_Enrage_Timer = 120000;
            }else Lord_Enrage_Timer -= diff;

            if(Lord_Hamstring_Timer < diff)
            {
                DoCast(m_creature->getVictim(), HAMSTRING);
                Lord_Hamstring_Timer = 9999999;
            }else Lord_Hamstring_Timer -= diff;

            if(Lord_Knockdown_Timer < diff)
            {
                DoCast(m_creature->getVictim(), KNOCKDOWN);
                Lord_Knockdown_Timer = 9999999;
            }else Lord_Knockdown_Timer -= diff;

            if(Lord_MortalStrike_Timer < diff)
            {
                DoCast(m_creature->getVictim(), MORTAL_STRIKE);
                Lord_MortalStrike_Timer = 9999999;
            }else Lord_MortalStrike_Timer -= diff;

            if(Lord_SunderArmor_Timer < diff)
            {
                DoCast(m_creature->getVictim(), SUNDER_ARMOR);
                Lord_SunderArmor_Timer = 45000;
            }else Lord_SunderArmor_Timer -= diff;

            if(Lord_Thunderclap_Timer < diff)
            {
                DoCast(m_creature->getVictim(), THUNDERCLAP);
                Lord_Thunderclap_Timer = 9999999;
            }else Lord_Thunderclap_Timer -= diff;
            
            break;
        //Infinite Assassin
        case 17835:
            if(Assasin_Backstab_Timer < diff)
            {
                DoCast(m_creature->getVictim(), BACKSTAB);
                Assasin_Backstab_Timer = 9999999;
            }else Assasin_Backstab_Timer -= diff;

            if(Assasin_KidneyShot_Timer < diff)
            {
                DoCast(m_creature->getVictim(), KIDNEY_SHOT);
                Assasin_KidneyShot_Timer = 9999999;
            }else Assasin_KidneyShot_Timer -= diff;

            if(Assasin_Rupture_Timer < diff)
            {
                DoCast(m_creature->getVictim(), RUPTURE);
                Assasin_Rupture_Timer = 9999999;
            }else Assasin_Rupture_Timer -= diff;

            if(Assasin_SinisterStrike_Timer < diff)
            {
                DoCast(m_creature->getVictim(), SINISTER_STRIKE);
                Assasin_SinisterStrike_Timer = 10000;
            }else Assasin_SinisterStrike_Timer -= diff;
            
            break;
        //Infinite Chronomancer
        case 17892:
            if(Chrono_ArcaneBolt_Timer < diff)
            {
                DoCast(m_creature->getVictim(), ARCANE_BOLT);
                Chrono_ArcaneBolt_Timer = 9999999;
            }else Chrono_ArcaneBolt_Timer -= diff;

            if(Chrono_ArcaneExplosion_Timer < diff)
            {
                DoCast(m_creature->getVictim(), ARCANE_EXPLOSION);
                Chrono_ArcaneExplosion_Timer = 9999999;
            }else Chrono_ArcaneExplosion_Timer -= diff;

            if(Chrono_FrostNova_Timer < diff)
            {
                DoCast(m_creature->getVictim(), FROST_NOVA);
                Chrono_FrostNova_Timer = 9999999;
            }else Chrono_FrostNova_Timer -= diff;

            if(Chrono_FrostBolt_Timer < diff)
            {
                DoCast(m_creature->getVictim(), FROST_BOLT_CHRONO);
                Chrono_FrostBolt_Timer = 9999999;
            }else Chrono_FrostBolt_Timer -= diff;
            
            break;
        //Infinite Executioner
        case 18994:
            if(Executioner_Cleave_Timer < diff)
            {
                DoCast(m_creature->getVictim(), CLEAVE);
                Executioner_Cleave_Timer = 7000;
            }else Executioner_Cleave_Timer -= diff;

            if(Executioner_Hamstring_Timer < diff)
            {
                DoCast(m_creature->getVictim(), HAMSTRING);
                Executioner_Hamstring_Timer = 9999999;
            }else Executioner_Hamstring_Timer -= diff;

            if(Executioner_Overpower_Timer < diff)
            {
                DoCast(m_creature->getVictim(), OVERPOWER);
                Executioner_Overpower_Timer = 9999999;
            }else Executioner_Overpower_Timer -= diff;

            if(Executioner_Strike_Timer < diff)
            {
                DoCast(m_creature->getVictim(), STRIKE);
                Executioner_Strike_Timer = 15000;
            }else Executioner_Strike_Timer -= diff;
            
            break;
        //Infinite Vanquisher
        case 21139:            
            break;
        //Infinite Whelp
        case 21818:
            break;
        }
        }
        
        if (!IsChanneling)
            DoMeleeAttackIfReady();
    }

    void AttackedBy(Unit *who)
    {
        m_creature->InterruptNonMeleeSpells(false);
        AttackStart(who);
        MayNotCastCorrupt = true;
        IsChanneling = false;
    }

    void KilledUnit(Unit *who)
    {
        Creature *pMedivh = (Creature*)(Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MEDIVH)));
        uint32 CreatureID = m_creature->GetEntry();
        
        if(!m_creature->getVictim()) {
            if (!(CreatureID == 17839 || CreatureID == 21104))
            {
                MayNotCastCorrupt = false;
                IsChanneling = false;
            }
        }
    }
};
 
CreatureAI* GetAI_mobs_infinite_adds(Creature *_Creature)
{
    return new mobs_infinite_adds (_Creature);
};

bool GossipHello_npc_saat(Player *player, Creature *_Creature)
{
    if (_Creature->isQuestGiver())
        player->PrepareQuestMenu( _Creature->GetGUID() );

    ScriptedInstance* pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());
    if(!pInstance->IsEncounterInProgress())    
    {
        player->ADD_GOSSIP_ITEM(0,"Give me a Chrono Beacon please.",GOSSIP_SENDER_MAIN,GOSSIP_ACTION_INFO_DEF+1);
        player->SEND_GOSSIP_MENU(_Creature->GetNpcTextId(),_Creature->GetGUID());
    }
    return true; 
}

bool GossipSelect_npc_saat(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if (action == GOSSIP_ACTION_INFO_DEF+1)
    {
        player->CLOSE_GOSSIP_MENU();
        _Creature->CastSpell(player,34975,false);        
    }
    return true;
}

struct TRINITY_DLL_DECL npc_saat : public ScriptedAI
{
    npc_saat(Creature *c) : ScriptedAI(c) 
    {
        once = false;
    }
 
    bool once;

    void Reset(){}
    void Aggro(Unit *who){}

    void MoveInLineOfSight(Unit *who)
    {
        if (!m_creature->IsHostileTo(who) && !once && m_creature->IsWithinDistInMap(who, 20))
        {
            DoScriptText(SAY_ENTER, m_creature);
            once = true;
        }
    }
    
    void UpdateAI(const uint32 diff){}
};
 
CreatureAI* GetAI_npc_saat(Creature *_Creature)
{
    return new npc_saat (_Creature);
};
#define SPELL_SANDBREATH_TIMEKEEPER        31478


struct TRINITY_DLL_DECL mob_time_keeper : public ScriptedAI
{
    mob_time_keeper(Creature *c) : ScriptedAI(c){}

    uint32 death_timer;
    uint32 breath_timer;
 
    void Reset()
    {
        death_timer = 60000;
        breath_timer = 10000;
    }    
    void Aggro(Unit *who){}
    void UpdateAI(const uint32 diff)
    {
        if(death_timer < diff)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            m_creature->RemoveCorpse();
            death_timer = 99999999;
        }else death_timer -= diff;

        if (!UpdateVictim())
            return;

        if(breath_timer < diff)
        {
            DoCast(m_creature,SPELL_SANDBREATH_TIMEKEEPER);
            breath_timer = 10000;
        }else breath_timer -= diff;
    }
};
 
CreatureAI* GetAI_mob_time_keeper(Creature *_Creature)
{
    return new mob_time_keeper (_Creature);
};

void AddSC_mob_event_darkportal()
{    
    Script *newscript;    
    newscript = new Script;    
    newscript->Name="mob_medivh";    
    newscript->GetAI = GetAI_mob_medivh;    
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name="mob_dark_portal_controllers";
    newscript->GetAI = GetAI_mob_dark_portal_controllers;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name="mob_time_rift";
    newscript->GetAI = GetAI_mob_time_rift;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name="mobs_infinite_adds";
    newscript->GetAI = GetAI_mobs_infinite_adds;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_time_keeper";
    newscript->GetAI = GetAI_mob_time_keeper;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_saat";
     newscript->GetAI = GetAI_npc_saat;
    newscript->pGossipHello =  &GossipHello_npc_saat;
    newscript->pGossipSelect = &GossipSelect_npc_saat;
    newscript->RegisterSelf();
}

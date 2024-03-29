
#include "precompiled.h"
#include "def_hyjal.h"
#include "hyjal_trash.h"

#define SPELL_CARRION_SWARM 31306
#define SPELL_SLEEP 31298
#define SPELL_VAMPIRIC_AURA 38196
#define SPELL_INFERNO 31299
#define SPELL_BERSERK 26662

#define SAY_ONDEATH "The clock... is still... ticking."
#define SOUND_ONDEATH 10982

#define SAY_ONSLAY1 "Your hopes are lost!"
#define SAY_ONSLAY2 "Scream for me!"
#define SAY_ONSLAY3 "Pity, no time for a slow death!"
#define SOUND_ONSLAY1 10981
#define SOUND_ONSLAY2 11038
#define SOUND_ONSLAY3 11039

#define SAY_SWARM1 "The swarm is eager to feed!"
#define SAY_SWARM2 "Pestilence upon you!"
#define SOUND_SWARM1 10979
#define SOUND_SWARM2 11037

#define SAY_SLEEP1 "You look tired..."
#define SAY_SLEEP2 "Sweet dreams..."
#define SOUND_SLEEP1 10978
#define SOUND_SLEEP2 11545

#define SAY_INFERNO1 "Let fire rain from above!"
#define SAY_INFERNO2 "Earth and sky shall burn!"
#define SOUND_INFERNO1 10980
#define SOUND_INFERNO2 11036

#define SAY_ONAGGRO "You are defenders of a doomed world! Flee here, and perhaps you will prolong your pathetic lives!"
#define SOUND_ONAGGRO 10977

struct TRINITY_DLL_DECL boss_anetheronAI : public hyjal_trashAI
{
    boss_anetheronAI(Creature *c) : hyjal_trashAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        go = false;
        pos = 0;
        SpellEntry *TempSpell = (SpellEntry*)GetSpellStore()->LookupEntry(SPELL_SLEEP);
        if(TempSpell && TempSpell->EffectImplicitTargetA[0] != 1)
        {
            TempSpell->EffectImplicitTargetA[0] = 1;
            TempSpell->EffectImplicitTargetB[0] = 0;
        }
    }

    uint32 SwarmTimer;
    uint32 SleepTimer;
    uint32 AuraTimer;
    uint32 InfernoTimer;
    uint32 EnrageTimer;
    bool enraged;
    bool go;
    uint32 pos;

    void Reset()
    {
        damageTaken = 0;
        SwarmTimer = 20000;
        SleepTimer = 45000;
        AuraTimer = 5000;
        InfernoTimer = 30000;
        EnrageTimer = 600000;
        enraged = false;

        if(pInstance && IsEvent)
            pInstance->SetData(DATA_ANETHERONEVENT, NOT_STARTED);
    }

    void EnterCombat(Unit *who)
    {
        if(pInstance && IsEvent)
            pInstance->SetData(DATA_ANETHERONEVENT, IN_PROGRESS);
        DoPlaySoundToSet(m_creature, SOUND_ONAGGRO);
        DoYell(SAY_ONAGGRO, LANG_UNIVERSAL, NULL);
    }

    void KilledUnit(Unit *victim)
    {
        switch(rand()%3)
        {
            case 0:
                DoPlaySoundToSet(m_creature, SOUND_ONSLAY1);
                DoYell(SAY_ONSLAY1, LANG_UNIVERSAL, NULL);
                break;
            case 1:
                DoPlaySoundToSet(m_creature, SOUND_ONSLAY2);
                DoYell(SAY_ONSLAY2, LANG_UNIVERSAL, NULL);
                break;
            case 2:
                DoPlaySoundToSet(m_creature, SOUND_ONSLAY3);
                DoYell(SAY_ONSLAY3, LANG_UNIVERSAL, NULL);
                break;
        }
    }

    void WaypointReached(uint32 i)
    {
        pos = i;
        if (i == 7 && pInstance)
        {
            Unit* target = Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_JAINAPROUDMOORE));
            if (target && target->isAlive())
                m_creature->AddThreat(target,0.0);
        }
    }

    void JustDied(Unit *victim)
    {
        hyjal_trashAI::JustDied(victim);
        if(pInstance && IsEvent)
            pInstance->SetData(DATA_ANETHERONEVENT, DONE);
        DoPlaySoundToSet(m_creature, SOUND_ONDEATH);
        DoYell(SAY_ONDEATH, LANG_UNIVERSAL, NULL);
    }

    void UpdateAI(const uint32 diff)
    {
        if (IsEvent)
        {
            //Must update npc_escortAI
            npc_escortAI::UpdateAI(diff);
            if(!go)
            {
                go = true;
                if(pInstance)
                {
                    AddWaypoint(0, 4896.08,    -1576.35,    1333.65);
                    AddWaypoint(1, 4898.68,    -1615.02,    1329.48);
                    AddWaypoint(2, 4907.12,    -1667.08,    1321.00);
                    AddWaypoint(3, 4963.18,    -1699.35,    1340.51);
                    AddWaypoint(4, 4989.16,    -1716.67,    1335.74);
                    AddWaypoint(5, 5026.27,    -1736.89,    1323.02);
                    AddWaypoint(6, 5037.77,    -1770.56,    1324.36);
                    AddWaypoint(7, 5067.23,    -1789.95,    1321.17);
                    Start(false, true);
                    SetDespawnAtEnd(false);
                }
            }
        }

        //Return since we have no target
        if (!UpdateVictim() )
            return;

        if(SwarmTimer < diff)
        {
            Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0,100,true);
            if(target)
                DoCast(target,SPELL_CARRION_SWARM);

            SwarmTimer = 15000 + rand()%5000;
            switch(rand()%2)
            {
                case 0:
                    DoPlaySoundToSet(m_creature, SOUND_SWARM1);
                    DoYell(SAY_SWARM1, LANG_UNIVERSAL, NULL);
                    break;
                case 1:
                    DoPlaySoundToSet(m_creature, SOUND_SWARM2);
                    DoYell(SAY_SWARM2, LANG_UNIVERSAL, NULL);
                    break;
            }
        }else SwarmTimer -= diff;

        if(SleepTimer < diff)
        {
            for(uint8 i=0;i<3;++i)
            {
                Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0,100,true);
                if(target)
                    target->CastSpell(target,SPELL_SLEEP,true);
            }
            SleepTimer = 40000;
            switch(rand()%2)
            {
                case 0:
                    DoPlaySoundToSet(m_creature, SOUND_SLEEP1);
                    DoYell(SAY_SLEEP1, LANG_UNIVERSAL, NULL);
                    break;
                case 1:
                    DoPlaySoundToSet(m_creature, SOUND_SLEEP2);
                    DoYell(SAY_SLEEP2, LANG_UNIVERSAL, NULL);
                    break;
            }
        }else SleepTimer -= diff;
        if(AuraTimer < diff)
        {
            DoCast(m_creature, SPELL_VAMPIRIC_AURA,true);
            AuraTimer = 10000+rand()%10000;
        }else AuraTimer -= diff;
        if(InfernoTimer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM,0,100,true), SPELL_INFERNO);
            InfernoTimer = 45000;
            switch(rand()%2)
            {
                case 0:
                    DoPlaySoundToSet(m_creature, SOUND_INFERNO1);
                    DoYell(SAY_INFERNO1, LANG_UNIVERSAL, NULL);
                    break;
                case 1:
                    DoPlaySoundToSet(m_creature, SOUND_INFERNO2);
                    DoYell(SAY_INFERNO2, LANG_UNIVERSAL, NULL);
                    break;
            }
        }else InfernoTimer -= diff;

        if(EnrageTimer < diff && !enraged)
        {
            m_creature->InterruptNonMeleeSpells(false);
            DoCast(m_creature, SPELL_BERSERK, true);
            enraged = true;
            EnrageTimer = 600000;
        }else EnrageTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_anetheron(Creature *_Creature)
{
    return new boss_anetheronAI (_Creature);
}

#define SPELL_IMMOLATION 31304
#define SPELL_INFERNO_EFFECT 31302

struct TRINITY_DLL_DECL mob_towering_infernalAI : public ScriptedAI
{
    mob_towering_infernalAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        if(pInstance)
            AnetheronGUID = pInstance->GetData64(DATA_ANETHERON);
    }

    uint32 CheckTimer;
    uint32 ImmolationTimer;
    uint64 AnetheronGUID;
    ScriptedInstance* pInstance;

    void Reset()
    {
        DoCast(m_creature, SPELL_INFERNO_EFFECT);
        ImmolationTimer = 5000;
        CheckTimer = 5000;
    }

    void EnterCombat(Unit *who)
    {

    }

    void KilledUnit(Unit *victim)
    {

    }

    void JustDied(Unit *victim)
    {

    }

    void MoveInLineOfSight(Unit *who)
    {
        if (m_creature->GetDistance(who) <= 50 && !m_creature->isInCombat() && m_creature->IsHostileTo(who))
        {
            m_creature->AddThreat(who,0.0);
            m_creature->Attack(who,false);
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if(CheckTimer < diff)
        {
            if(AnetheronGUID)
            {
                Creature* boss = Unit::GetCreature((*m_creature),AnetheronGUID);
                if(!boss || (boss && boss->isDead()))
                {
                    m_creature->setDeathState(JUST_DIED);
                    m_creature->RemoveCorpse();
                    return;
                }
            }
            CheckTimer = 5000;
        }else CheckTimer -= diff;

        //Return since we have no target
        if (!UpdateVictim())
            return;

        if(ImmolationTimer < diff)
        {
            DoCast(m_creature, SPELL_IMMOLATION);
            ImmolationTimer = 5000;
        }else ImmolationTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_towering_infernal(Creature *_Creature)
{
    return new mob_towering_infernalAI (_Creature);
}

void AddSC_boss_anetheron()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_anetheron";
    newscript->GetAI = &GetAI_boss_anetheron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_towering_infernal";
    newscript->GetAI = &GetAI_mob_towering_infernal;
    newscript->RegisterSelf();
}

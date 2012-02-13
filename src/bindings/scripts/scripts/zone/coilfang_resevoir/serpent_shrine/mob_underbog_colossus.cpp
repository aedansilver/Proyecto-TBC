#include "precompiled.h"
#include "def_serpent_shrine.h"

//weaknesses
#define SPELL_DMG_AMPLIFICATION_FIRE               38088
#define SPELL_DMG_AMPLIFICATION_FROST              38089
#define SPELL_DMG_AMPLIFICATION_SHADOW             38092
#define SPELL_DMG_AMPLIFICATION_ARCANE             38087


//ability packs
//pack 1
#define SPELL_FRENZY                    38166
#define SPELL_ATROPHIC_BLOW             39015

//pack 2
#define SPELL_ACID_GEYSER               38971
#define SPELL_PARASITE                  39044
#define PARASITE                        22379

//pack 3
#define SPELL_SPORE_QUAKE               38976
#define SPELL_RAMPANT_INFECTION         39042

//JustDied definitions
#define SPELL_TOXIC_POOL                38718
#define SPELL_REFRESHING_MIST           38730

//spawns
#define COLOSSUS_LURKER                 22347
#define COLOSSUS_RAGER                  22352

/*
UPDATE `creature_template` SET `ScriptName` = 'mob_underbog_colossus' WHERE `entry` = 21251;
UPDATE `creature_template` SET `ScriptName` = 'mob_parasite_spawn' WHERE `entry` = 22379;
-- Parasite lvl
UPDATE `creature_template` SET `minlevel` = 71, `maxlevel` = 71 WHERE `entry` = 22379;
*/

struct TRINITY_DLL_DECL mob_underbog_colossusAI : public ScriptedAI
{

    mob_underbog_colossusAI(Creature* c) : ScriptedAI(c) {}
    
    uint32 Ability;
    uint32 AbilityMain_Timer;
    uint32 AbilityMinor_Timer;
    uint32 DeadState_Timer;
    
    void Reset()
    {
        switch (rand()%4)
                {
                case 0:
                    DoCast(m_creature,SPELL_DMG_AMPLIFICATION_FIRE);
                    break;
                case 1:
                    DoCast(m_creature,SPELL_DMG_AMPLIFICATION_ARCANE);
                    break;
                case 2:
                    DoCast(m_creature,SPELL_DMG_AMPLIFICATION_FROST);
                    break;
                case 3:
                    DoCast(m_creature,SPELL_DMG_AMPLIFICATION_SHADOW);
                    break;
                }
        Ability = rand()%3;
        AbilityMain_Timer = 15000;
        AbilityMinor_Timer = 10000;
    }

    void Aggro(Unit *who) {}
    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!UpdateVictim() )
            return;

        if (AbilityMain_Timer < diff)
        {
            switch (Ability)
                {
                case 0:
                    DoAbilityOne(true);
                    break;
                case 1:
                    DoAbilityTwo(true);
                    break;
                case 2:
                    DoAbilityThree(true);
                    break;
                }
            AbilityMain_Timer = 20000;
        }else AbilityMain_Timer -= diff;   
        
        if (AbilityMinor_Timer < diff)
        {
            switch (Ability)
                {
                case 0:
                    DoAbilityOne(false);
                    break;
                case 1:
                    DoAbilityTwo(false);
                    break;
                case 2:
                    DoAbilityThree(false);
                    break;
                }
            AbilityMinor_Timer = 20000;
        }else AbilityMinor_Timer -= diff;   
        
        DoMeleeAttackIfReady();
    }


    void DoAbilityOne(bool MainAbility){
        if (MainAbility){
            DoCast(m_creature, SPELL_FRENZY);
        }else {
            DoCast(m_creature->getVictim(), SPELL_ATROPHIC_BLOW);
        }

    }
    void DoAbilityTwo(bool MainAbility){
        if (MainAbility){
            Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            DoCast(target, SPELL_ACID_GEYSER);
        }else {
            Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            Creature* Parasite = m_creature->SummonCreature(PARASITE, m_creature->GetPositionX() , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
            if(Parasite && target)
                ((CreatureAI*)Parasite->AI())->AttackStart(target);
        }

    }
    void DoAbilityThree(bool MainAbility){
        if (MainAbility){
            DoCast(m_creature, SPELL_SPORE_QUAKE);
        }else {
            
            //doesn't work properly, only affects Colossus himself...
            /*Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            if (target) */
            //    DoCast(m_creature, SPELL_RAMPANT_INFECTION);
            Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            Creature* Parasite = m_creature->SummonCreature(PARASITE, m_creature->GetPositionX() , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
            if(Parasite && target)
                ((CreatureAI*)Parasite->AI())->AttackStart(target);
        }

    }
    
    void DamageTaken(Unit* pKiller, uint32 &damage)
    {
       if (m_creature->GetHealth() <= damage)
        {
            Unit* target = NULL;
            switch (rand()%5)
                {
                case 0:
                    Creature *lurker1;
                    lurker1 = m_creature->SummonCreature(COLOSSUS_LURKER, m_creature->GetPositionX() + 5 , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                    target = SelectUnit(SELECT_TARGET_RANDOM,0);
                    if (target && lurker1)
                        ((CreatureAI*)lurker1->AI())->AttackStart(target);
                    Creature *lurker2;
                    lurker2 = m_creature->SummonCreature(COLOSSUS_LURKER, m_creature->GetPositionX() - 5 , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                    target = SelectUnit(SELECT_TARGET_RANDOM,0);
                    if (target && lurker2)
                        ((CreatureAI*)lurker2->AI())->AttackStart(target);
                    break;
                case 1:
                    for (uint32 i = 0; i < 10; i++){
                        Creature *rager;
                        rager = m_creature->SummonCreature(COLOSSUS_RAGER, m_creature->GetPositionX() + rand()%10 , m_creature->GetPositionY() + rand()%10, m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 20000);
                        target = SelectUnit(SELECT_TARGET_RANDOM,0);
                        if (target && rager)
                            ((CreatureAI*)rager->AI())->AttackStart(target);
                        }
                    break;
                case 2:
                    Creature *tempSpawn;
                    tempSpawn = m_creature->SummonCreature(12999, m_creature->GetPositionX() , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 11000);
                    if (tempSpawn){
                        tempSpawn->SetVisibility(VISIBILITY_OFF);
                        tempSpawn->CastSpell(tempSpawn, 33356, true);
                        tempSpawn->setFaction(14);
                        tempSpawn->SetLevel(71);
                        tempSpawn->CastSpell(tempSpawn, SPELL_TOXIC_POOL, true);
                    }
                    break;
                case 3:
                    Creature *tempSpawn1;
                    tempSpawn1 = m_creature->SummonCreature(12999, m_creature->GetPositionX() , m_creature->GetPositionY() , m_creature->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 21000);
                    if (tempSpawn1){
                        tempSpawn1->SetVisibility(VISIBILITY_OFF);
                        tempSpawn1->CastSpell(tempSpawn1, 33356, true);
                        tempSpawn1->setFaction(35);
                        tempSpawn1->CastSpell(tempSpawn1, SPELL_REFRESHING_MIST, true);
                    }
                    break;
                case 4:
                    //do nothing
                    break;
                }
        }
    }
};
struct TRINITY_DLL_DECL mob_parasiteAI_spawn : public ScriptedAI
{
    mob_parasiteAI_spawn(Creature *c) : ScriptedAI(c) { Reset(); }
    
    uint32 Jump_Timer;

    void Reset(){
        Jump_Timer = 1000;
    }
    void Aggro(Unit *who) {}
    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->isAlive())
            return;

        if (Jump_Timer < diff)
        {
            Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            if (target){
                m_creature->Attack(target, true);
                DoCast(target, SPELL_PARASITE);
            }
            Jump_Timer = 3000;
        }else Jump_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_parasite_spawn(Creature* c)
{
    return new mob_parasiteAI_spawn(c);
}

CreatureAI* GetAI_mob_underbog_colossus(Creature* c)
{
    return new mob_underbog_colossusAI(c);
}
void AddSC_mob_underbog_colossus()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="mob_underbog_colossus";
    newscript->GetAI = GetAI_mob_underbog_colossus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_parasite_spawn";
    newscript->GetAI = GetAI_mob_parasite_spawn;
    newscript->RegisterSelf();
}

#include "precompiled.h"
#include "def_serpent_shrine.h"

// Random Buffs
#define SPELL_ARCANE_DESTRUCTION			38647
#define SPELL_FIRE_DESTRUCTION	            38648
#define SPELL_FROST_DESTRUCTION			38649

// Attack Spells
#define SPELL_ARCANE_LIGHTNING			38634
#define SPELL_ARCANE_VOLLEY				38633
#define SPELL_CONE_OF_COLD				38644
#define SPELL_FIREBALL					38641
#define SPELL_FROSTBOLT					38645
#define SPELL_RAIN_OF_FIRE				38635
#define SPELL_SCORCH					38636

enum abilities
{
    ABILITY_RAIN_OF_FIRE 	= 0,
    ABILITY_AOE 			= 1,
    ABILITY_SCORCH			= 2,
    ABILITY_ATTACK 			= 3,
    ABILITY_MAX			= 4
};
/*
-- Greyheart Nether-Mage
UPDATE creature_template set ScriptName = 'mob_greyheart_nethermage' WHERE entry=21230;
*/
struct TRINITY_DLL_DECL mob_greyheart_nethermageAI : public ScriptedAI
{

    mob_greyheart_nethermageAI(Creature* c) : ScriptedAI(c) { }
    
    uint32 spellTimer[ABILITY_MAX];
    
    void Reset()
    {
        switch (rand()%3)
        {
            case 0:
                DoCast(m_creature,SPELL_ARCANE_DESTRUCTION);
                break;
            case 1:
                DoCast(m_creature,SPELL_FIRE_DESTRUCTION);
                break;
            case 2:
                DoCast(m_creature,SPELL_FROST_DESTRUCTION);
                break;
        }

        spellTimer[ABILITY_ATTACK] = 0;
        spellTimer[ABILITY_SCORCH] = 6000;
        spellTimer[ABILITY_AOE] = 15000;
        spellTimer[ABILITY_RAIN_OF_FIRE ] = 20000;
    }

    void Aggro(Unit *who) {}

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!UpdateVictim() )
            return;

        for(uint8 i=0;i<ABILITY_MAX;++i)
        {
            if (spellTimer[i] <= diff)
            {
                if (m_creature->IsNonMeleeSpellCasted(false))
					continue;

                switch(i)
                {
                    case ABILITY_RAIN_OF_FIRE:
                    {
                        DoCast(m_creature->getVictim(), SPELL_RAIN_OF_FIRE);
                        spellTimer[ABILITY_RAIN_OF_FIRE] = 20000;
						break;
                    }
                    case ABILITY_AOE:
                    {
                        switch (rand()%3)
                        {
                            case 0:
                                DoCast(m_creature->getVictim(), SPELL_ARCANE_LIGHTNING);
                                break;
                            case 1:
                                DoCast(m_creature->getVictim(), SPELL_ARCANE_VOLLEY);
                                break;
                            case 2:
                                DoCast(m_creature->getVictim(), SPELL_CONE_OF_COLD);
                                break;
                        }
                        spellTimer[ABILITY_AOE] = 10000;
						break;
                    }
                    case ABILITY_SCORCH:
                    {
                        DoCast(m_creature->getVictim(), SPELL_SCORCH);
                        spellTimer[ABILITY_SCORCH] = 6000;
						break;
                    }
                    case ABILITY_ATTACK:
                    {
                        switch (rand()%2)
                        {
                            case 0:
                                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_FIREBALL);
                                break;
                            case 1:
                                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_FROSTBOLT);
                                break;
                        }
                        spellTimer[ABILITY_ATTACK] = 1500;
						break;
                    }
                }
            } 
            else spellTimer[i] -= diff;   
        }
        DoMeleeAttackIfReady();
    }
  
};

CreatureAI* GetAI_mob_greyheart_nethermage(Creature* c)
{
    return new mob_greyheart_nethermageAI(c);
}
void AddSC_mob_greyheart_nethermage()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="mob_greyheart_nethermage";
    newscript->GetAI = GetAI_mob_greyheart_nethermage;
    newscript->RegisterSelf();
}

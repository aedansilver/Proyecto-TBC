/* ScriptData
SDName: npc_newsagent
SD%Complete: XX
SDComment: 
SDCategory: Shattrah City, Custom npc for spamming the news ;)
EndScriptData */

#include "precompiled.h"

#define SAY_NEWS1               -5000001
#define SAY_NEWS2               -5000002
#define SAY_NEWS3               -5000003

struct TRINITY_DLL_DECL npc_newsagent : public ScriptedAI
{
    npc_newsagent(Creature *c) : ScriptedAI(c) {}
 
    uint32 say_timer;

    void Reset()
	{
		say_timer = 20000;
	}
    void Aggro(Unit *who){}

    void MoveInLineOfSight(Unit *who)
    {}

    void UpdateAI(const uint32 diff)
    {
        	if (say_timer < diff)
        	{
              	switch(rand()%3)
                {
                  	case 0: DoScriptText(SAY_NEWS1, m_creature);break;
					case 1: DoScriptText(SAY_NEWS1, m_creature);break;
					case 2: DoScriptText(SAY_NEWS1, m_creature);break;
				}
				say_timer = 20000+rand()%5000;
        	}else say_timer -= diff;
    }
};
 
CreatureAI* GetAI_npc_newsagent(Creature *_Creature)
{
    return new npc_newsagent (_Creature);
};

void AddSC_npc_newsagent()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="npc_newsagent";
    newscript->GetAI = GetAI_npc_newsagent;
    newscript->RegisterSelf();
}

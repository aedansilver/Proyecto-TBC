#include "precompiled.h"

/*####################################################################################
##										EDIT HERE
####################################################################################*/

#define GOSSIP_BUFF "Ich bräuchte etwas Hilfe." // Text
#define SPELL_BUFF1		25898 // Greater Blessing of Kings
#define SPELL_BUFF2		32999 // Prayer of Spirit
#define SPELL_BUFF3		25392 // Prayer of Fortitude
#define SPELL_BUFF4		39374 // Prayer of Shadow Protection
#define SPELL_BUFF5		27127 // Arcane Brilliance
#define SPELL_BUFF6		26991 // Gift of the Wild

/*####################################################################################
##									DONT TOUCH THIS CODE
####################################################################################*/


bool GossipHello_npc_buff(Player *player, Creature *_Creature)
{
        player->ADD_GOSSIP_ITEM(0, GOSSIP_BUFF, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    player->SEND_GOSSIP_MENU(_Creature->GetNpcTextId(), _Creature->GetGUID());
    return true;
}


bool GossipSelect_npc_buff(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if(action == GOSSIP_ACTION_INFO_DEF)
    {
        player->CLOSE_GOSSIP_MENU();
        _Creature->CastSpell(player, SPELL_BUFF1, false);
		_Creature->CastSpell(player, SPELL_BUFF2, false);
		_Creature->CastSpell(player, SPELL_BUFF3, false);
		_Creature->CastSpell(player, SPELL_BUFF4, false);
		_Creature->CastSpell(player, SPELL_BUFF5, false);
		_Creature->CastSpell(player, SPELL_BUFF6, false);
    }
    return true;
}

void AddSC_lov()
{
	Script *newscript;
    newscript = new Script;
    newscript->Name="npc_buff";
    newscript->pGossipHello = &GossipHello_npc_buff;
    newscript->pGossipSelect = &GossipSelect_npc_buff;
    newscript->RegisterSelf();
}


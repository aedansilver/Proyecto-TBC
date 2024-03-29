/* Copyright (C) 2006 - 2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: Western_Plaguelands
SD%Complete: 90
SDComment: Quest support: 5216, 5219, 5222, 5225, 5229, 5231, 5233, 5235. To obtain Vitreous Focuser (could use more spesifics about gossip items)
SDCategory: Western Plaguelands
EndScriptData */

/* ContentData
npcs_dithers_and_arbington
npc_the_scourge_cauldron
EndContentData */

#include "precompiled.h"

/*######
## npcs_dithers_and_arbington
######*/

#define GOSSIP_HDA1 "Was wird für den Kessel des Teufelssteinfelds benötigt?"
#define GOSSIP_HDA2 "Was wird für den Kessel von Dalsons Tränenfeld benötigt?"
#define GOSSIP_HDA3 "Was wird für den Kessel des trostlosen Felds benötigt?"
#define GOSSIP_HDA4 "Was wird für den Kessel von Gahrrons Trauerfeld benötigt?"

#define GOSSIP_SDA1 "Ich brauche einen glasartigen Fokussierer"

bool GossipHello_npcs_dithers_and_arbington(Player *player, Creature *_Creature)
{
    if(_Creature->isQuestGiver())
        player->PrepareQuestMenu( _Creature->GetGUID() );
    if (_Creature->isVendor())
        player->ADD_GOSSIP_ITEM(1, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    if(player->GetQuestRewardStatus(5237) || player->GetQuestRewardStatus(5238))
    {
        player->ADD_GOSSIP_ITEM(0, GOSSIP_HDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        player->ADD_GOSSIP_ITEM(0, GOSSIP_HDA2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        player->ADD_GOSSIP_ITEM(0, GOSSIP_HDA3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
        player->ADD_GOSSIP_ITEM(0, GOSSIP_HDA4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
        player->SEND_GOSSIP_MENU(3985, _Creature->GetGUID());
    }else
        player->SEND_GOSSIP_MENU(_Creature->GetNpcTextId(), _Creature->GetGUID());

    return true;
}

bool GossipSelect_npcs_dithers_and_arbington(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    switch(action)
    {
        case GOSSIP_ACTION_TRADE:
            player->SEND_VENDORLIST( _Creature->GetGUID() );
            break;
        case GOSSIP_ACTION_INFO_DEF+1:
            player->ADD_GOSSIP_ITEM(0, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            player->SEND_GOSSIP_MENU(3980, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            player->ADD_GOSSIP_ITEM(0, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            player->SEND_GOSSIP_MENU(3981, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            player->ADD_GOSSIP_ITEM(0, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            player->SEND_GOSSIP_MENU(3982, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            player->ADD_GOSSIP_ITEM(0, GOSSIP_SDA1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            player->SEND_GOSSIP_MENU(3983, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            player->CLOSE_GOSSIP_MENU();
            _Creature->CastSpell(player, 17529, false);
            break;
    }
    return true;
}

/*######
## npc_the_scourge_cauldron
######*/

struct TRINITY_DLL_DECL npc_the_scourge_cauldronAI : public ScriptedAI
{
    npc_the_scourge_cauldronAI(Creature *c) : ScriptedAI(c) {}

    void Reset() {}

    void EnterCombat(Unit* who) {}

    void DoDie()
    {
        //summoner dies here
        m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        //override any database `spawntimesecs` to prevent duplicated summons
        uint32 rTime = m_creature->GetRespawnDelay();
        if( rTime<600 )
            m_creature->SetRespawnDelay(600);
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || who->GetTypeId() != TYPEID_PLAYER)
            return;

        if(who->GetTypeId() == TYPEID_PLAYER)
        {
            switch(m_creature->GetAreaId())
            {
                case 199:                                   //felstone
                    if( ((Player*)who)->GetQuestStatus(5216) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5229) == QUEST_STATUS_INCOMPLETE )
                    {
                        DoSpawnCreature(11075,0,0,0,m_creature->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
                case 200:                                   //dalson
                    if( ((Player*)who)->GetQuestStatus(5219) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5231) == QUEST_STATUS_INCOMPLETE )
                    {
                        DoSpawnCreature(11077,0,0,0,m_creature->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
                case 201:                                   //gahrron
                    if( ((Player*)who)->GetQuestStatus(5225) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5235) == QUEST_STATUS_INCOMPLETE )
                    {
                        DoSpawnCreature(11078,0,0,0,m_creature->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
                case 202:                                   //writhing
                    if( ((Player*)who)->GetQuestStatus(5222) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5233) == QUEST_STATUS_INCOMPLETE )
                    {
                        DoSpawnCreature(11076,0,0,0,m_creature->GetOrientation(),TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
            }
        }
    }
};
CreatureAI* GetAI_npc_the_scourge_cauldron(Creature *_Creature)
{
    return new npc_the_scourge_cauldronAI (_Creature);
}

/*######
##
######*/

void AddSC_western_plaguelands()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="npcs_dithers_and_arbington";
    newscript->pGossipHello = &GossipHello_npcs_dithers_and_arbington;
    newscript->pGossipSelect = &GossipSelect_npcs_dithers_and_arbington;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_the_scourge_cauldron";
    newscript->GetAI = &GetAI_npc_the_scourge_cauldron;
    newscript->RegisterSelf();
}


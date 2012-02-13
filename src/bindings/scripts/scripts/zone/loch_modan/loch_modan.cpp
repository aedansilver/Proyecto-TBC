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
SDName: Loch_Modan
SD%Complete: 100
SDComment: Quest support: 3181
SDCategory: Loch Modan
EndScriptData */

/* ContentData
npc_mountaineer_pebblebitty
EndContentData */

#include "precompiled.h"

/*######
## npc_mountaineer_pebblebitty
######*/

#define GOSSIP_MP "Öffne bitte das Tor. Ich muß in die Sengende Schlucht reisen"

#define GOSSIP_MP1 "Aber ich muss dort hin. Öffne jetzt das Tor!"
#define GOSSIP_MP2 "Ok, wo ist dieser andere Weg?"
#define GOSSIP_MP3 "Das macht nichts. Ich bin unverwundbar."
#define GOSSIP_MP4 "Ja..."
#define GOSSIP_MP5 "Ok, Ich werde daran denken."
#define GOSSIP_MP6 "Ein Schlüssel? Ok!"

bool GossipHello_npc_mountaineer_pebblebitty(Player *player, Creature *_Creature)
{
    if (_Creature->isQuestGiver())
        player->PrepareQuestMenu( _Creature->GetGUID() );

    if (!player->GetQuestRewardStatus(3181) == 1)
        player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    player->SEND_GOSSIP_MENU(_Creature->GetNpcTextId(), _Creature->GetGUID());

    return true;
}

bool GossipSelect_npc_mountaineer_pebblebitty(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    switch (action)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            player->SEND_GOSSIP_MENU(1833, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            player->SEND_GOSSIP_MENU(1834, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            player->SEND_GOSSIP_MENU(1835, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            player->SEND_GOSSIP_MENU(1836, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            player->SEND_GOSSIP_MENU(1837, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+6:
            player->ADD_GOSSIP_ITEM( 0, GOSSIP_MP6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            player->SEND_GOSSIP_MENU(1838, _Creature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+7:
            player->CLOSE_GOSSIP_MENU();
            break;
    }
    return true;
}

void AddSC_loch_modan()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="npc_mountaineer_pebblebitty";
    newscript->pGossipHello =  &GossipHello_npc_mountaineer_pebblebitty;
    newscript->pGossipSelect = &GossipSelect_npc_mountaineer_pebblebitty;
    newscript->RegisterSelf();
}


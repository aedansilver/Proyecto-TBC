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

/*
DELETE FROM `creature_template` WHERE (`entry`=500000);
INSERT INTO `creature_template` (`entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `flag1`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `ScriptName`) VALUES (500000, 23766, 0, 23766, 0, 'Barber', '', '', 70, 70, 1, 1, 0, 0, 0, 35, 35, 1, 1, 1, 0, 0, 0, 0, 0, 2000, 0, 33538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 0, 1, 0, 0, 'barber');

*/
#include "precompiled.h"
#include "barber.h"

bool GossipHello_barber(Player *player, Creature *_Creature)
{
    int32 text = 0;
    uint8 standState = player->getStandState();
    bool sitting = true;

    if (player->IsStandState() || standState == PLAYER_STATE_SIT || standState == PLAYER_STATE_SLEEP || standState == PLAYER_STATE_KNEEL )
        sitting = false;

    // Select a gossip text
    if(!sitting)
        text = player->GetTeam() == ALLIANCE ? 50011 : 50000;
    else switch (player->getRace())
    {
        case RACE_HUMAN:
            text = player->getGender() == GENDER_FEMALE ? 50013 : 50012;
            break;
        case RACE_ORC:
            text = player->getGender() == GENDER_FEMALE ? 50002 : 50001;
            break;
        case RACE_DWARF:
            text = player->getGender() == GENDER_FEMALE ? 50015 : 50014;
            break;
        case RACE_NIGHTELF:
            text = player->getGender() == GENDER_FEMALE ? 50019 : 50018;
            break;
        case RACE_UNDEAD_PLAYER:
            text = player->getGender() == GENDER_FEMALE ? 50008 : 50007;
            break;
        case RACE_TAUREN:
            text = player->getGender() == GENDER_FEMALE ? 50006 : 50005;
            break;
        case RACE_GNOME:
            text = player->getGender() == GENDER_FEMALE ? 50017 : 50016;
            break;        
        case RACE_DRAENEI:
            text = player->getGender() == GENDER_FEMALE ? 50021 : 50020;
            break;
        case RACE_TROLL:
            text = player->getGender() == GENDER_FEMALE ? 50004 : 50003;
            break;
        case RACE_BLOODELF:
            text = player->getGender() == GENDER_FEMALE ? 50010 : 50009;
            break;

            break;
    }
    // store values to restore if player choose to cancel
    hairstyle = player->GetByteValue(PLAYER_BYTES, 2); 
    haircolor = player->GetByteValue(PLAYER_BYTES, 3); 
    facialfeature = player->GetByteValue(PLAYER_BYTES_2, 0); 
    if ( sitting )
    {
        if ( !player->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM))
            player->ToggleFlag(PLAYER_FLAGS, PLAYER_FLAGS_HIDE_HELM);

        if ( player->GetMoney() >= 50000 )
             player->ADD_GOSSIP_ITEM(0, "Let's do it! Here are the money. ( 5 gold )", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        else 
             player->ADD_GOSSIP_ITEM(0, "Sorry, I don't have enough money right now. ( 5 gold )", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
    }
    player->SEND_GOSSIP_MENU(text,_Creature->GetGUID());
    return true;
}

void ChangeEffect(Player *player )
{
    // First Send update to player, so most recent datas are up
    player->SendUpdateToPlayer(player); 

    // Force client to reload this player, so changes are visible
    WorldPacket data(SMSG_FORCE_DISPLAY_UPDATE, 8);
    data << player->GetGUID();
    player->SendMessageToSet(&data,true);

    // Do some visual effect ( Vanish visual spell )
    player->CastSpell(player,24222,true);
}

void SelectHairStyle(Player *player, int change )
{
    uint8 max=maxHairStyles[player->getRace()].maxMale;
    if ( player->getGender() == GENDER_FEMALE )
        max=maxHairStyles[player->getRace()].maxFemale;

    int current = player->GetByteValue(PLAYER_BYTES, 2);

    current += change;

    if ( current > max )
        current = 0;
    else if ( current < 0 )
        current = max;

    player->SetByteValue(PLAYER_BYTES, 2, current);
    ChangeEffect(player);
}

void SelectHairColor(Player *player, int change )
{
    uint8 max=maxHairColor[player->getRace()];
    int current = player->GetByteValue(PLAYER_BYTES, 3);

    current += change;

    if ( current > max )
        current = 0;
    else if ( current < 0 )
        current = max;

    player->SetByteValue(PLAYER_BYTES, 3, current);
    ChangeEffect(player);
}

void SelectFacialFeature(Player *player, int change )
{
    uint8 max=maxFacialFeatures[player->getRace()].maxMale;
    if ( player->getGender() == GENDER_FEMALE )
        max=maxFacialFeatures[player->getRace()].maxFemale;

    int current = player->GetByteValue(PLAYER_BYTES_2, 0); 

    current += change;

    if ( current > max )
        current = 0;
    else if ( current < 0 )
        current = max;

    player->SetByteValue(PLAYER_BYTES_2, 0, current);
    ChangeEffect(player);
}

bool GossipSelect_barber(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    char const* FeatureGossipMenu = "I want to change my facial hair style.";
    switch (player->getRace())
    {
        case RACE_HUMAN:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my piercings.";
            break;
        case RACE_ORC:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my piercings.";
            break;
        case RACE_DWARF:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my earrings.";
            break;
        case RACE_NIGHTELF:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my markings.";
            break;
        case RACE_UNDEAD_PLAYER:
            FeatureGossipMenu = "I want to change my face.";
            break;
        case RACE_TAUREN:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my hair.";
            break;
        case RACE_GNOME:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my earrings.";
            break;
        case RACE_TROLL:
            FeatureGossipMenu = "I want to change my tusks.";
            break;
        case RACE_BLOODELF:
            if ( player->getGender() == GENDER_FEMALE )
                FeatureGossipMenu = "I want to change my earrings.";
            break;
        case RACE_DRAENEI:
            player->getGender() == GENDER_FEMALE ? FeatureGossipMenu = "I want to change my horns." : FeatureGossipMenu = "I want to change my tentacles.";
            break;
	}
    // MAP
    // 1 - main menu
    // 2 - next hair style
    // 3 - prev hair style
    // 4 - next hair color
    // 5 - prev hair color
    // 6 - next facial feature
    // 7 - prev facial feature
    // 8 - not enought gold, or other close

    switch (action)
    {
        // After player requested the action
        case GOSSIP_ACTION_INFO_DEF+1:   
            if ( sender == GOSSIP_SENDER_MAIN )
            {
                if(player->GetMoney() >= 50000)
                    player->ModifyMoney(-50000);
                else
                    player->SendBuyError( BUY_ERR_NOT_ENOUGHT_MONEY, _Creature, 0, 0);
            }
            player->ADD_GOSSIP_ITEM( 0, "I want to change my hair style.", GOSSIP_SENDER_OPTION , GOSSIP_ACTION_INFO_DEF + 2);
            player->ADD_GOSSIP_ITEM( 0, "I want to change my hair color.", GOSSIP_SENDER_OPTION , GOSSIP_ACTION_INFO_DEF + 4);
            player->ADD_GOSSIP_ITEM( 0, FeatureGossipMenu, GOSSIP_SENDER_OPTION , GOSSIP_ACTION_INFO_DEF + 6);
            player->SEND_GOSSIP_MENU(50023, _Creature->GetGUID());
            break;
        // hair style
        // next - increase hair style
        case GOSSIP_ACTION_INFO_DEF+2:
            if ( sender == GOSSIP_SENDER_SUBOPTION )
                SelectHairStyle(player,1);	
        // previous - decrease it
        case GOSSIP_ACTION_INFO_DEF+3:
            if ( action == GOSSIP_ACTION_INFO_DEF+3 && sender == GOSSIP_SENDER_SUBOPTION )
                SelectHairStyle(player,-1);				
            // choose options again
            player->ADD_GOSSIP_ITEM( 0, "Next one!", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 2);
            player->ADD_GOSSIP_ITEM( 0, "Previous one!", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 3);
            player->ADD_GOSSIP_ITEM( 0, "I'll have this one.", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(50024, _Creature->GetGUID());
            break;

        // hair color
        // next - increase hair color
        case GOSSIP_ACTION_INFO_DEF+4:
            if ( sender == GOSSIP_SENDER_SUBOPTION )
                SelectHairColor(player,1);	
        // previous - decrease hair color
        case GOSSIP_ACTION_INFO_DEF+5:
            if ( action == GOSSIP_ACTION_INFO_DEF+5 && sender == GOSSIP_SENDER_SUBOPTION )
                SelectHairColor(player,-1);					
            // choose options again
            player->ADD_GOSSIP_ITEM( 0, "Next one!", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 4);
            player->ADD_GOSSIP_ITEM( 0, "Previous one!",GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 5);
            player->ADD_GOSSIP_ITEM( 0, "I'll have this one.", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(50024, _Creature->GetGUID());
            break;

        // facial feature
        // next - increase hair style
        case GOSSIP_ACTION_INFO_DEF+6:
            if ( sender == GOSSIP_SENDER_SUBOPTION )
                SelectFacialFeature(player,1);	
        // previous - decrease it
        case GOSSIP_ACTION_INFO_DEF+7:
            if ( action == GOSSIP_ACTION_INFO_DEF+7 && sender == GOSSIP_SENDER_SUBOPTION )
                SelectFacialFeature(player,-1);				
            // choose options again
            player->ADD_GOSSIP_ITEM( 0, "Next one!", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 6);
            player->ADD_GOSSIP_ITEM( 0, "Previous one!", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 7);
            player->ADD_GOSSIP_ITEM( 0, "I'll have this one.", GOSSIP_SENDER_SUBOPTION , GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(50024, _Creature->GetGUID());
            break;

        // cannot affort
        case GOSSIP_ACTION_INFO_DEF+8:
            player->PlayerTalkClass->CloseGossip();
            break;

    }
    return true;
}


void AddSC_barber()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="barber";
    newscript->pGossipHello =           &GossipHello_barber;
    newscript->pGossipSelect =          &GossipSelect_barber;
    newscript->RegisterSelf();
}

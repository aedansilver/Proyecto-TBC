/* Copyright (C) 2008 Trinity <http://www.trinitycore.org/>
 *
 * Thanks to the original authors: ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information 
 * Germanpatch by Lov
 */
#ifndef SC_PLAYER_H
#define SC_PLAYER_H
#include "Player.h"
#include "GossipDef.h"
#include "QuestDef.h"
// Gossip Item Text
#define GOSSIP_TEXT_BROWSE_GOODS        "Ich sehe mich hier nur mal um"
#define GOSSIP_TEXT_TRAIN               "Ich benötige eine Ausbildung"
#define GOSSIP_TEXT_BANK                "Die Bank"
#define GOSSIP_TEXT_WINDRIDER           "Der Windreitermeister"
#define GOSSIP_TEXT_GRYPHON             "Der Greifenmeister"
#define GOSSIP_TEXT_BATHANDLER          "Der Fledermausführer"
#define GOSSIP_TEXT_HIPPOGRYPH          "Der Hippogryphenmeister"
#define GOSSIP_TEXT_FLIGHTMASTER        "Der Flugmeister"
#define GOSSIP_TEXT_AUCTIONHOUSE        "Das Auktionshaus"
#define GOSSIP_TEXT_GUILDMASTER         "Der Gildenmeister"
#define GOSSIP_TEXT_INN                 "Ein Gasthaus"
#define GOSSIP_TEXT_MAILBOX             "Ein Postkasten"
#define GOSSIP_TEXT_STABLEMASTER        "Der Stallmeister"
#define GOSSIP_TEXT_WEAPONMASTER        "Der Waffenlehrer"
#define GOSSIP_TEXT_BATTLEMASTER        "Kampfmeister"
#define GOSSIP_TEXT_CLASSTRAINER        "Ein Lehrer für eine Klasse"
#define GOSSIP_TEXT_PROFTRAINER         "Ein Lehrer für einen Beruf"
#define GOSSIP_TEXT_OFFICERS            "Die Offiziersmesse"
#define GOSSIP_TEXT_ALTERACVALLEY       "Alteractal"
#define GOSSIP_TEXT_ARATHIBASIN         "Arathibecken"
#define GOSSIP_TEXT_WARSONGULCH         "Kriegshymnenschlucht"
#define GOSSIP_TEXT_ARENA               "Arena"
#define GOSSIP_TEXT_EYEOFTHESTORM       "Auge des Sturms"
#define GOSSIP_TEXT_DRUID               "Druide"
#define GOSSIP_TEXT_HUNTER              "Jäger"
#define GOSSIP_TEXT_PRIEST              "Priester"
#define GOSSIP_TEXT_ROGUE               "Schurke"
#define GOSSIP_TEXT_WARRIOR             "Krieger"
#define GOSSIP_TEXT_PALADIN             "Paladin"
#define GOSSIP_TEXT_SHAMAN              "Schamane"
#define GOSSIP_TEXT_MAGE                "Magier"
#define GOSSIP_TEXT_WARLOCK             "Hexenmeister"
#define GOSSIP_TEXT_ALCHEMY             "Alchemie"
#define GOSSIP_TEXT_BLACKSMITHING       "Schmiedekunst"
#define GOSSIP_TEXT_COOKING             "Kochen"
#define GOSSIP_TEXT_ENCHANTING          "Verzauberungskunst"
#define GOSSIP_TEXT_ENGINEERING         "Ingenieurskunst"
#define GOSSIP_TEXT_FIRSTAID            "Erste Hilfe"
#define GOSSIP_TEXT_HERBALISM           "Kräuterkunde"
#define GOSSIP_TEXT_LEATHERWORKING      "Lederverarbeitung"
#define GOSSIP_TEXT_POISONS             "Gifte"
#define GOSSIP_TEXT_TAILORING           "Schneiderei"
#define GOSSIP_TEXT_MINING              "Bergbau"
#define GOSSIP_TEXT_FISHING             "Angeln"
#define GOSSIP_TEXT_SKINNING            "Kürschnerei"
#define GOSSIP_TEXT_JEWELCRAFTING       "Juwelenschleifen"
#define GOSSIP_TEXT_IRONFORGE_BANK      "Bank von Eisenschmiede"
#define GOSSIP_TEXT_STORMWIND_BANK      "Bank von Sturmwind"
#define GOSSIP_TEXT_DEEPRUNTRAM         "Die Tiefenbahn"
#define GOSSIP_TEXT_ZEPPLINMASTER       "Zeppelinmeister"
#define GOSSIP_TEXT_FERRY               "F�hre"
// Skill defines
#define TRADESKILL_ALCHEMY                  1
#define TRADESKILL_BLACKSMITHING            2
#define TRADESKILL_COOKING                  3
#define TRADESKILL_ENCHANTING               4
#define TRADESKILL_ENGINEERING              5
#define TRADESKILL_FIRSTAID                 6
#define TRADESKILL_HERBALISM                7
#define TRADESKILL_LEATHERWORKING           8
#define TRADESKILL_POISONS                  9
#define TRADESKILL_TAILORING                10
#define TRADESKILL_MINING                   11
#define TRADESKILL_FISHING                  12
#define TRADESKILL_SKINNING                 13
#define TRADESKILL_JEWLCRAFTING             14
#define TRADESKILL_LEVEL_NONE               0
#define TRADESKILL_LEVEL_APPRENTICE         1
#define TRADESKILL_LEVEL_JOURNEYMAN         2
#define TRADESKILL_LEVEL_EXPERT             3
#define TRADESKILL_LEVEL_ARTISAN            4
#define TRADESKILL_LEVEL_MASTER             5
// Gossip defines
#define GOSSIP_ICON_CHAT                    0
#define GOSSIP_ACTION_TRADE                 1
#define GOSSIP_ACTION_TRAIN                 2
#define GOSSIP_ACTION_TAXI                  3
#define GOSSIP_ACTION_GUILD                 4
#define GOSSIP_ACTION_BATTLE                5
#define GOSSIP_ACTION_BANK                  6
#define GOSSIP_ACTION_INN                   7
#define GOSSIP_ACTION_HEAL                  8
#define GOSSIP_ACTION_TABARD                9
#define GOSSIP_ACTION_AUCTION               10
#define GOSSIP_ACTION_INN_INFO              11
#define GOSSIP_ACTION_UNLEARN               12
#define GOSSIP_ACTION_INFO_DEF              1000
#define GOSSIP_SENDER_MAIN                  1
#define GOSSIP_SENDER_INN_INFO              2
#define GOSSIP_SENDER_INFO                  3
#define GOSSIP_SENDER_SEC_PROFTRAIN         4
#define GOSSIP_SENDER_SEC_CLASSTRAIN        5
#define GOSSIP_SENDER_SEC_BATTLEINFO        6
#define GOSSIP_SENDER_SEC_BANK              7
#define GOSSIP_SENDER_SEC_INN               8
#define GOSSIP_SENDER_SEC_MAILBOX           9
#define GOSSIP_SENDER_SEC_STABLEMASTER      10
#define DEFAULT_GOSSIP_MESSAGE              0xffffff
extern uint32 GetSkillLevel(Player *player,uint32 skill);
// Defined fuctions to use with player.
// This fuction add's a menu item,
// a - Icon Id
// b - Text
// c - Sender(this is to identify the current Menu with this item)
// d - Action (identifys this Menu Item)
// e - Text to be displayed in pop up box
// f - Money value in pop up box
#define ADD_GOSSIP_ITEM(a,b,c,d)   PlayerTalkClass->GetGossipMenu().AddMenuItem(a,b,c,d,"",0)
#define ADD_GOSSIP_ITEM_EXTENDED(a,b,c,d,e,f,g)   PlayerTalkClass->GetGossipMenu().AddMenuItem(a,b,c,d,e,f,g)
// This fuction Sends the current menu to show to client, a - NPCTEXTID(uint32) , b - npc guid(uint64)
#define SEND_GOSSIP_MENU(a,b)      PlayerTalkClass->SendGossipMenu(a,b)
// This fuction shows POI(point of interest) to client.
// a - position X
// b - position Y
// c - Icon Id
// d - Flags
// e - Data
// f - Location Name
#define SEND_POI(a,b,c,d,e,f)      PlayerTalkClass->SendPointOfInterest(a,b,c,d,e,f)
// Closes the Menu
#define CLOSE_GOSSIP_MENU()        PlayerTalkClass->CloseGossip()
// Fuction to tell to client the details
// a - quest object
// b - npc guid(uint64)
// c - Activate accept(bool)
#define SEND_QUEST_DETAILS(a,b,c)  PlayerTalkClass->SendQuestDetails(a,b,c)
// Fuction to tell to client the requested items to complete quest
// a - quest object
// b - npc guid(uint64)
// c - Iscompletable(bool)
// d - close at cancel(bool) - in case single incomplite ques
#define SEND_REQUESTEDITEMS(a,b,c,d) PlayerTalkClass->SendRequestedItems(a,b,c,d)
// Fuctions to send NPC lists, a - is always the npc guid(uint64)
#define SEND_VENDORLIST(a)         GetSession()->SendListInventory(a)
#define SEND_TRAINERLIST(a)        GetSession()->SendTrainerList(a)
#define SEND_BANKERLIST(a)         GetSession()->SendShowBank(a)
#define SEND_TABARDLIST(a)         GetSession()->SendTabardVendorActivate(a)
#define SEND_AUCTIONLIST(a)        GetSession()->SendAuctionHello(a)
#define SEND_TAXILIST(a)           GetSession()->SendTaxiStatus(a)
// Ressurect's the player if is dead.
#define SEND_SPRESURRECT()         GetSession()->SendSpiritResurrect()
// Get the player's honor rank.
#define GET_HONORRANK()            GetHonorRank()
// -----------------------------------
// defined fuctions to use with Creature
#define QUEST_DIALOG_STATUS(a,b,c)   GetSession()->getDialogStatus(a,b,c)
#endif
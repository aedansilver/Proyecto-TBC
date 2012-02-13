/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Wailing Caverns
SD%Complete: 80
SDComment: Need some more polishing and in the event the druids should fly away not just morph and dissapear
SDCategory: Wailing Caverns
EndScriptData */

/* ContentData

INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1043000,'At last! Naralex can be awakened! Come aid me, brave adventurers!',0,1,0,0,'Disciple SAY_AT_LAST'),
(-1043001,'I must make the necessary preparations before the awakening ritual can begin. You must protect me!',0,0,0,0,'Disciple SAY_MAKE_PREPARATIONS'),
(-1043002,'These caverns were once a temple of promise for regrowth in the Barrens. Now, they are the halls of nightmares.',0,0,0,0,'Disciple SAY_TEMPLE_OF_PROMISE'),
(-1043003,'Come. We must continue. There is much to be done before we can pull Naralex from his nightmare.',0,0,0,0,'Disciple SAY_MUST_CONTINUE'),
(-1043004,'Within this circle of fire I must cast the spell to banish the spirits of the slain Fanglords.',0,0,0,0,'Disciple SAY_BANISH_THE_SPIRITS'),
(-1043005,'The caverns have been purified. To Naralex\'s chamber we go!',0,0,0,0,'Disciple SAY_CAVERNS_PURIFIED'),
(-1043006,'Beyond this corridor, Naralex lies in fitful sleep. Let us go awaken him before it is too late.',0,0,0,0,'Disciple SAY_BEYOND_THIS_CORRIDOR'),
(-1043007,'Protect me brave souls as I delve into this Emerald Dream to rescue Naralex and put an end to this corruption!',0,0,0,0,'Disciple SAY_EMERALD_DREAM'),
(-1043008,'%s begins to perform the awakening ritual on Naralex.',0,2,0,0,'Disciple EMOTE_AWAKENING_RITUAL'),
(-1043009,'%s tosses fitfully in troubled sleep.',0,2,0,0,'Naralex EMOTE_TROUBLED_SLEEP'),
(-1043010,'%s writhes in agony. The Disciple seems to be breaking through.',0,2,0,0,'Naralex EMOTE_WRITHE_IN_AGONY'),
(-1043011,'%s dreams up a horrendous vision. Something stirs beneath the murky waters.',0,2,0,0,'Naralex EMOTE_HORRENDOUS_VISION'),
(-1043012,'This Mutanus the Devourer is a minion from Naralex\'s nightmare no doubt!',0,0,0,0,'Disciple SAY_MUTANUS_THE_DEVOURER'),
(-1043013,'I AM AWAKE, AT LAST!',0,1,0,0,'Naralex SAY_I_AM_AWAKE'),
(-1043014,'At last! Naralex awakes from the nightmare.',0,0,0,0,'Disciple SAY_NARALEX_AWAKES'),
(-1043015,'Ah, to be pulled from the dreaded nightmare! I thank you, my loyal Disciple, along with your brave companions.',0,0,0,0,'Naralex SAY_THANK_YOU'),
(-1043016,'We must go and gather with the other Disciples. There is much work to be done before I can make another attempt to restore the Barrens. Farewell, brave souls!',0,0,0,0,'Naralex SAY_FAREWELL'),
(-1043017,'Attacked! Help get this $N off of me!',0,0,0,0,'Disciple SAY_ATTACKED');

INSERT INTO creature_ai_scripts (creature_id,event_type,event_chance,event_flags,action1_type,action1_param1,action1_param2,comment) VALUES
(3669,6,100,6,34,1,3,'Lord Cobrahn - Set Inst Data on Death'),
(3670,6,100,6,34,2,3,'Lord Pythas - Set Inst Data on Death'),
(3671,6,100,6,34,3,3,'Lady Anacondra - Set Inst Data on Death'),
(3673,6,100,6,34,4,3,'Lord Serpentis - Set Inst Data on Death'),
(3654,6,100,6,34,9,3,'Mutanus the Devourer - Set Inst Data on Death');

DELETE FROM script_waypoint WHERE entry=3678;
INSERT INTO script_waypoint VALUES
(3678, 0, -120.864, 132.825, -79.2972, 4000, 'TYPE_NARALEX_EVENT'),
(3678, 1, -109.944, 155.417, -80.4659, 0, ''),
(3678, 2, -106.104, 198.456, -80.5970, 0, ''),
(3678, 3, -110.246, 214.763, -85.6669, 0, ''),
(3678, 4, -105.609, 236.184, -92.1732, 4000, 'TYPE_NARALEX_PART1'),
(3678, 5, -93.5297, 227.956, -90.7522, 0, ''),
(3678, 6, -85.3155, 226.976, -93.1286, 0, ''),
(3678, 7, -62.1510, 206.673, -93.5510, 0, ''),
(3678, 8, -45.0534, 205.580, -96.2435, 0, ''),
(3678, 9, -31.1235, 234.225, -94.0841, 0, ''),
(3678, 10, -49.2158, 269.141, -92.8442, 0, ''),
(3678, 11, -54.1220, 274.717, -92.8442, 4000, 'TYPE_NARALEX_PART2'),
(3678, 12, -58.9650, 282.274, -92.5380, 0, ''),
(3678, 13, -38.3566, 306.239, -90.0192, 0, ''),
(3678, 14, -28.8928, 312.842, -89.2155, 0, ''),
(3678, 15, -1.58198, 296.127, -85.5984, 0, ''),
(3678, 16, 9.89992, 272.008, -85.7759, 0, ''),
(3678, 17, 26.8162, 259.218, -87.3938, 0, ''),
(3678, 18, 49.1166, 227.259, -88.3379, 0, ''),
(3678, 19, 54.4171, 209.316, -90.0000, 1500, 'SAY_BEYOND_THIS_CORRIDOR'),
(3678, 20, 71.0380, 205.404, -93.0422, 0, ''),
(3678, 21, 81.5941, 212.832, -93.0154, 0, ''),
(3678, 22, 94.3376, 236.933, -95.8261, 0, ''),
(3678, 23, 114.619, 235.908, -96.0495, 0, ''),
(3678, 24, 114.777, 237.155, -96.0304, 2500, 'NARALEX_EVENT_FINISHED');

UPDATE creature_template SET ScriptName = 'npc_disciple_of_naralex' WHERE entry = 3678;
UPDATE instance_template SET script = 'instance_wailing_caverns' WHERE map = 43;

EndContentData */

#include "precompiled.h"
#include "../../npc/npc_escortAI.h"
#include "def_wailing_caverns.h"

/*######
## npc_disciple_of_naralex
######*/

enum
{
    //say
    SAY_MAKE_PREPARATIONS         = -1043001,
    SAY_TEMPLE_OF_PROMISE         = -1043002,
    SAY_MUST_CONTINUE             = -1043003,
    SAY_BANISH_THE_SPIRITS        = -1043004,
    SAY_CAVERNS_PURIFIED          = -1043005,
    SAY_BEYOND_THIS_CORRIDOR      = -1043006,
    SAY_EMERALD_DREAM             = -1043007,
    SAY_MUTANUS_THE_DEVOURER      = -1043012,
    SAY_NARALEX_AWAKES            = -1043014,
    SAY_THANK_YOU                 = -1043015,
    SAY_FAREWELL                  = -1043016,
    SAY_ATTACKED                  = -1043017,
    //yell
    SAY_AT_LAST                   = -1043000,
    SAY_I_AM_AWAKE                = -1043013,
    //emote
    EMOTE_AWAKENING_RITUAL        = -1043008,
    EMOTE_TROUBLED_SLEEP          = -1043009,
    EMOTE_WRITHE_IN_AGONY         = -1043010,
    EMOTE_HORRENDOUS_VISION       = -1043011,
    //spell
    SPELL_MARK_OF_THE_WILD_RANK_2 = 5232,
    SPELL_SERPENTINE_CLEANSING    = 6270,
    SPELL_NATURE_CHANNELING       = 13236,
    SPELL_NARALEXS_AWAKENING      = 6271,
    SPELL_FLIGHT_FROM             = 33943,
    //npc entry
    NPC_DEVIATE_RAVAGER           = 3636,
    NPC_DEVIATE_VIPER             = 5755,
    NPC_DEVIATE_MOCCASIN          = 5762,
    NPC_NIGHTMARE_ECTOPLASM       = 5763,
    NPC_MUTANUS_THE_DEVOURER      = 3654,
};

#define GOSSIP_ID_START_1       698  //Naralex sleeps again!
#define GOSSIP_ID_START_2       699  //The fanglords are dead!
#define GOSSIP_ITEM_NARALEX     "Let the event begin!"

struct TRINITY_DLL_DECL npc_disciple_of_naralexAI : public npc_escortAI
{
    npc_disciple_of_naralexAI(Creature *c) : npc_escortAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
    }

    uint32 eventTimer;
    uint32 currentEvent;
    uint32 summonsAlive;
    uint32 eventProgress;

    uint64 NaralexGUID;

    ScriptedInstance *pInstance;

    void WaypointReached(uint32 i)
    {
        if (!pInstance)
            return;

        switch ( i )
        {
            case 5:
                eventProgress = 1;
                currentEvent = TYPE_NARALEX_PART1;
                pInstance->SetData(TYPE_NARALEX_PART1, IN_PROGRESS);
            break;
            case 12:
                eventProgress = 1;
                currentEvent = TYPE_NARALEX_PART2;
                pInstance->SetData(TYPE_NARALEX_PART2, IN_PROGRESS);
            break;
            case 20:
                DoScriptText(SAY_BEYOND_THIS_CORRIDOR, m_creature);
            break;
            case 25:
                eventProgress = 1;
                currentEvent = TYPE_NARALEX_PART3;
                pInstance->SetData(TYPE_NARALEX_PART3, IN_PROGRESS);
            break;
        }
    }

    void Reset() 
    { 
        NaralexGUID = pInstance->GetData64(DATA_NARALEX);

        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);//turn gossip on so players can restart the event
        eventTimer = 0;
        summonsAlive = 0;
        currentEvent = 0;
        eventProgress = 0;
    
    }

    void DamageTaken(Unit *who, uint32 &damage)
    {
        DoScriptText(SAY_ATTACKED, m_creature, who);
    }

    void JustSummoned(Creature *summoned)
    {
        summonsAlive++;
        summoned->AI()->AttackStart(m_creature);
    }

    void SummonedCreatureDespawn(Creature *summoned)
    {
        summonsAlive--;
    }

    void Aggro(Unit *who){}

    void JustDied(Unit *slayer)
    {
        if (pInstance)
        {
            pInstance->SetData(TYPE_NARALEX_EVENT, FAIL);
            pInstance->SetData(TYPE_NARALEX_PART1, FAIL);
            pInstance->SetData(TYPE_NARALEX_PART2, FAIL);
            pInstance->SetData(TYPE_NARALEX_PART3, FAIL);
        }
    }

    void UpdateAI(const uint32 diff)
    {
        npc_escortAI::UpdateAI(diff);

        if (!pInstance)
            return;

        if (pInstance->GetData(currentEvent) == IN_PROGRESS)
        {
            switch (currentEvent)
            {
                case TYPE_NARALEX_PART1:
                    if (eventProgress == 1)
                    {
                        eventProgress++;
                        DoScriptText(SAY_TEMPLE_OF_PROMISE, m_creature);
                        m_creature->SummonCreature(NPC_DEVIATE_RAVAGER, -82.1763, 227.874, -93.3233, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                        m_creature->SummonCreature(NPC_DEVIATE_RAVAGER, -72.9506, 216.645, -97.6756, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                    }
                    else
                    if (eventProgress == 2 && summonsAlive <= 0)
                    {
                        DoScriptText(SAY_MUST_CONTINUE, m_creature);
                        pInstance->SetData(TYPE_NARALEX_PART1, DONE);
                    }
                break;
                case TYPE_NARALEX_PART2:
                    if (eventProgress == 1)
                    {
                        eventProgress++;
                        DoScriptText(SAY_BANISH_THE_SPIRITS, m_creature);
                        DoCast(m_creature, SPELL_SERPENTINE_CLEANSING);
                        m_creature->SummonCreature(NPC_DEVIATE_VIPER, -61.5261, 273.676, -92.8442, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                        m_creature->SummonCreature(NPC_DEVIATE_VIPER, -58.4658, 280.799, -92.8393, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                        m_creature->SummonCreature(NPC_DEVIATE_VIPER, -50.002,  278.578, -92.8442, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000);
                    }
                    else
                    if (eventProgress == 2 && summonsAlive <= 0)
                    {
                        DoScriptText(SAY_CAVERNS_PURIFIED, m_creature);
                        pInstance->SetData(TYPE_NARALEX_PART2, DONE);
                        if (m_creature->HasAura(SPELL_SERPENTINE_CLEANSING, 0))
                            m_creature->RemoveAurasDueToSpell(SPELL_SERPENTINE_CLEANSING);
                    }
                break;
                case TYPE_NARALEX_PART3:
                    if (eventTimer > 0)
                    {
                        eventTimer -= diff;
                    }
                    else
                    if (eventProgress == 1)
                    {
                        eventProgress++;
                        eventTimer = 15000;
                        m_creature->SetStandState(PLAYER_STATE_KNEEL);
                        DoScriptText(SAY_EMERALD_DREAM, m_creature);
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                            m_creature->CastSpell(naralex, SPELL_NATURE_CHANNELING, true);
                        DoScriptText(EMOTE_AWAKENING_RITUAL, m_creature);
                    }
                    else
                    if (eventProgress == 2)
                    {
                        eventProgress++;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                            DoScriptText(EMOTE_TROUBLED_SLEEP, naralex);
                        m_creature->SummonCreature(NPC_DEVIATE_MOCCASIN, 135.943, 199.701, -103.529, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_DEVIATE_MOCCASIN, 151.08,  221.13,  -103.609, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_DEVIATE_MOCCASIN, 128.007, 227.428, -103.351, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                    }
                    else
                    if (eventProgress == 3 && summonsAlive <= 0)
                    {
                        eventProgress++;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                            DoScriptText(EMOTE_WRITHE_IN_AGONY, naralex);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 133.413, 207.188, -102.469, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 142.857, 218.645, -102.905, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 105.102, 227.211, -102.752, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 153.372, 235.149, -102.826, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 149.524, 251.113, -102.558, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 136.208, 266.466, -102.977, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                        m_creature->SummonCreature(NPC_NIGHTMARE_ECTOPLASM, 126.167, 274.759, -102.962, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                    }
                    else
                    if (eventProgress == 4 && summonsAlive <= 0)
                    {
                        eventProgress++;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                        {
                            DoScriptText(EMOTE_HORRENDOUS_VISION, naralex);
                            m_creature->CastSpell(naralex, SPELL_NARALEXS_AWAKENING, false);
                        }
                        m_creature->SummonCreature(NPC_MUTANUS_THE_DEVOURER, 150.872, 262.905, -103.503, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                        DoScriptText(SAY_MUTANUS_THE_DEVOURER, m_creature);
                        pInstance->SetData(TYPE_MUTANUS_THE_DEVOURER, IN_PROGRESS);
                    }
                    else
                    if (eventProgress == 5 && TYPE_MUTANUS_THE_DEVOURER == DONE)
                    {
                        eventProgress++;
                        eventTimer = 1500;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                        {
                            if (naralex->HasAura(SPELL_NATURE_CHANNELING,0))
                                naralex->RemoveAurasDueToSpell(SPELL_NATURE_CHANNELING);
                            if (m_creature->HasAura(SPELL_NARALEXS_AWAKENING, 0))
                                m_creature->RemoveAurasDueToSpell(SPELL_NARALEXS_AWAKENING);
                            naralex->SetStandState(PLAYER_STATE_NONE);
                            DoScriptText(SAY_I_AM_AWAKE, naralex);
                        }
                        DoScriptText(SAY_NARALEX_AWAKES, m_creature);
                    }
                    else
                    if (eventProgress == 6)
                    {
                        eventProgress++;
                        eventTimer = 1500;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                            DoScriptText(SAY_THANK_YOU, naralex);
                    }
                    else
                    if (eventProgress == 7)
                    {
                        eventProgress++;
                        eventTimer = 1500;
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                        {
                            DoScriptText(SAY_FAREWELL, naralex);
                            naralex->CastSpell(naralex, SPELL_FLIGHT_FROM, true);
                        }
                        m_creature->CastSpell(m_creature, SPELL_FLIGHT_FROM, true);
                    }
                    else
                    if (eventProgress == 8)
                    {
                        pInstance->SetData(TYPE_NARALEX_PART3, DONE);
                        if (Unit* naralex = Unit::GetUnit((*m_creature), NaralexGUID))
                        {
                            naralex->SetVisibility(VISIBILITY_OFF);
                        }
                        m_creature->SetVisibility(VISIBILITY_OFF);
                    }
                break;
            }
        }
    }
};

CreatureAI* GetAI_npc_disciple_of_naralex(Creature *_Creature)
{
    npc_disciple_of_naralexAI *thisAI = new npc_disciple_of_naralexAI(_Creature);

    thisAI->AddWaypoint(0, -120.864, 132.825, -79.2972, 4000);
    thisAI->AddWaypoint(1, -109.944, 155.417, -80.4659, 0);
    thisAI->AddWaypoint(2, -106.104, 198.456, -80.5970, 0);
    thisAI->AddWaypoint(3, -110.246, 214.763, -85.6669, 0);
    thisAI->AddWaypoint(4, -105.609, 236.184, -92.1732, 4000);
    thisAI->AddWaypoint(5, -93.5297, 227.956, -90.7522, 0);
    thisAI->AddWaypoint(6, -85.3155, 226.976, -93.1286, 0);
    thisAI->AddWaypoint(7, -62.1510, 206.673, -93.5510, 0);
    thisAI->AddWaypoint(8, -45.0534, 205.580, -96.2435, 0);
    thisAI->AddWaypoint(9, -31.1235, 234.225, -94.0841, 0);
    thisAI->AddWaypoint(10, -49.2158, 269.141, -92.8442, 0);
    thisAI->AddWaypoint(11, -54.1220, 274.717, -92.8442, 4000);
    thisAI->AddWaypoint(12, -58.9650, 282.274, -92.5380, 0);
    thisAI->AddWaypoint(13, -38.3566, 306.239, -90.0192, 0);
    thisAI->AddWaypoint(14, -28.8928, 312.842, -89.2155, 0);
    thisAI->AddWaypoint(15, -1.58198, 296.127, -85.5984, 0);
    thisAI->AddWaypoint(16, 9.89992, 272.008, -85.7759, 0);
    thisAI->AddWaypoint(17, 26.8162, 259.218, -87.3938, 0);
    thisAI->AddWaypoint(18, 49.1166, 227.259, -88.3379, 0);
    thisAI->AddWaypoint(19, 54.4171, 209.316, -90.0000, 1500);
    thisAI->AddWaypoint(20, 71.0380, 205.404, -93.0422, 0);
    thisAI->AddWaypoint(21, 81.5941, 212.832, -93.0154, 0);
    thisAI->AddWaypoint(22, 94.3376, 236.933, -95.8261, 0);
    thisAI->AddWaypoint(23, 114.619, 235.908, -96.0495, 0);
    thisAI->AddWaypoint(24, 114.777, 237.155, -96.0304, 2500);

    return (CreatureAI*)thisAI;
}

bool GossipHello_npc_disciple_of_naralex(Player *player, Creature *_Creature)
{
    ScriptedInstance *pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());

    if (pInstance)
    {
        _Creature->CastSpell(player, SPELL_MARK_OF_THE_WILD_RANK_2, true);
        if ((pInstance->GetData(TYPE_LORD_COBRAHN) == DONE) && (pInstance->GetData(TYPE_LORD_PYTHAS) == DONE) &&
            (pInstance->GetData(TYPE_LADY_ANACONDRA) == DONE) && (pInstance->GetData(TYPE_LORD_SERPENTIS) == DONE))
        {
            player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_NARALEX, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(GOSSIP_ID_START_2, _Creature->GetGUID());

            DoScriptText(SAY_AT_LAST, _Creature);
        }
        else
        {
            player->SEND_GOSSIP_MENU(GOSSIP_ID_START_1, _Creature->GetGUID());
        }
    }
    return true;
}

bool GossipSelect_npc_disciple_of_naralex(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    ScriptedInstance *pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());
    if (action == GOSSIP_ACTION_INFO_DEF + 1)
    {
        player->CLOSE_GOSSIP_MENU();
        if (pInstance)
        {
            pInstance->SetData(TYPE_NARALEX_EVENT, IN_PROGRESS);
        }
        _Creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
        DoScriptText(SAY_MAKE_PREPARATIONS, _Creature);

        ((npc_escortAI*)(_Creature->AI()))->Start(true, true, false, player->GetGUID());
        _Creature->setFaction(113);
    }
    return true;
}

void AddSC_wailing_caverns()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_disciple_of_naralex";
    newscript->pGossipHello =  &GossipHello_npc_disciple_of_naralex;
    newscript->pGossipSelect = &GossipSelect_npc_disciple_of_naralex;
    newscript->GetAI = &GetAI_npc_disciple_of_naralex;
    newscript->RegisterSelf();
}

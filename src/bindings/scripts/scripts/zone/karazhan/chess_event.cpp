#include "precompiled.h"
#include "def_karazhan.h"

#define ALLI_CREATURE_FACTION 1690
#define HORDE_CREATURE_FACTION 1689
#define DUST_COVERED_CHEST  185119

#define GOSSIP_POSSES "Ich übernehme!" //need correction

#define EVENT_START "Lasst uns Schach spielen!"
#define NPC_ATTACK_RADIUS 7

#define SAY_AT_EVENT_START "Sehr gutw. Lasst das Spiel beginnen."
#define SOUND_START 10338

#define SAY_LOSE_KNIGHT_P "Yes...all according to plan."
#define SOUND_KNIGHT_LOSE_P 10349
#define SAY_LOSE_KNIGHT_M "Ja... natürlich."
#define SOUND_KNIGHT_LOSE_M 10350

#define SAY_LOSE_PAWN_P_1 "A transparent stratagem."
#define SOUND_LOSE_PAWN_P_1 10339
#define SAY_LOSE_PAWN_P_2 "Sehen wir mal."
#define SOUND_LOSE_PAWN_P_2 10340
#define SAY_LOSE_PAWN_P_3 "Ah, the wheels have begun to turn."
#define SOUND_LOSE_PAWN_P_3 10341
#define SAY_LOSE_PAWN_M_1 "Hmm."
#define SOUND_LOSE_PAWN_M_1 10342 
#define SAY_LOSE_PAWN_M_2 "Egal!"
#define SOUND_LOSE_PAWN_M_2 10344
#define SAY_LOSE_PAWN_M_3 "Interesting."
#define SOUND_LOSE_PAWN_M_3 10343

#define SAY_LOSE_QUEEN_P "Now it gets interesting."
#define SOUND_LOSE_QUEEN_P 10351
#define SAY_LOSE_QUEEN_M "Ahh, I should have known."
#define SOUND_LOSE_QUEEN_M 10352

#define SAY_LOSE_BISHOP_P "The slightest loss of concentration is all it takes."
#define SOUND_LOSE_BISHOP_P 10347
#define SAY_LOSE_BISHOP_M "A necessary sacrifice."
#define SOUND_LOSE_BISHOP_M 10348

#define SAY_LOSE_ROOK_P "Foolish! Very foolish!"
#define SOUND_LOSE_ROOK_P 10345
#define SAY_LOSE_ROOK_M "A minor concern."
#define SOUND_LOSE_ROOK_M 10346

#define SAY_PLAYER_CHECK "And so, the end draws near."
#define SOUND_PLAYER_CHECK 10353
#define SAY_MEDIVH_CHECK "As it should be."
#define SOUND_MEDIVH_CHECK 10354

#define SAY_PLAYER_WIN "And so it ends."
#define SOUND_PLAYER_WIN 10355
#define SAY_MEDIVH_WIN "Nothing less than perfection will do."
#define SOUND_MEDIVH_WIN 10356

#define SAY_MEDIVH_CHEAT_1 "Perhaps a change is in order."
#define SOUND_MEDIVH_CHEAT_1 //10357
#define SAY_MEDIVH_CHEAT_2 "Time for an alternative scenario."
#define SOUND_MEDIVH_CHEAT_2 10358
#define SAY_MEDIVH_CHEAT_3 "One must not become too complacent." 
#define SOUND_MEDIVH_CHEAT_3 10359

#define SPELL_HAND_OF_MEDIVH 39339 //berserk spell
#define SPELL_FURY_OF_MEDIVH 39383 //aoe spell
//and we have another cheat medivh heals the target to max.(m_creature->sethealth(m_creature->getmaxhealth()))

#define TRIGGER_ID 22519

#define NPC_MEDIVH 16816

#define NPC_PAWN_H 17469
#define NPC_PAWN_A 17211

#define NPC_KNIGHT_H 21748
#define NPC_KNIGHT_A 21664

#define NPC_QUEEN_H 21750
#define NPC_QUEEN_A 21683

#define NPC_BISHOP_H 21747
#define NPC_BISHOP_A 21682

#define BISHOP_HEAL_H 37456
#define BISHOP_HEAL_A 37455

#define NPC_ROOK_H 21726
#define NPC_ROOK_A 21160

#define NPC_KING_H 21752
#define NPC_KING_A 21684

#define SPELL_MOVE_1 37146
#define SPELL_MOVE_2 30012
#define SPELL_MOVE_3 37144
#define SPELL_MOVE_4 37148
#define SPELL_MOVE_5 37151
#define SPELL_MOVE_6 37152
#define SPELL_MOVE_7 37153

#define SPELL_CHANGE_FACING 30284
#define SPELL_MOVE_MARKER 32261

#define SEARCH_RANGE 5 
struct TRINITY_DLL_DECL move_triggerAI : public ScriptedAI
{
ScriptedInstance* pInstance;
uint32 search_time;
Unit *unit_on_me;
move_triggerAI(Creature *c) : ScriptedAI(c)
	{
		pInstance = ((ScriptedInstance*)m_creature->GetInstanceData());
		Reset();
	}
void Reset(){
	search_time = 4500;//imho better with movementinformation but possedai override scriptedai.dont work with movementinformation
	unit_on_me = NULL;
}
void Aggro(Unit *){}
void UpdateAI(const uint32 diff){
	//haxx?
	if(pInstance->GetData(DATA_CHESS_EVENT) != IN_PROGRESS)
			return;
	if(unit_on_me != NULL){
		if(search_time < diff ){
			if(m_creature->GetDistance2d(unit_on_me) != 0 || unit_on_me->isAlive()){
				unit_on_me = NULL;
			}

			search_time = 500;
		}else search_time -= diff;
	}
}
void SpellHit(Unit *caster,const SpellEntry *spell){
	if(spell->Id == SPELL_CHANGE_FACING)
		caster->SetInFront(m_creature);
	if(spell->Id == SPELL_MOVE_1 || spell->Id == SPELL_MOVE_2 || spell->Id == SPELL_MOVE_3
		|| spell->Id == SPELL_MOVE_4 || spell->Id == SPELL_MOVE_5 || spell->Id == SPELL_MOVE_6
		|| spell->Id == SPELL_MOVE_7){
	if(unit_on_me != NULL)
		return;
		caster->GetMotionMaster()->Clear();
		caster->GetMotionMaster()->MovePoint(0,m_creature->GetPositionX(),m_creature->GetPositionY(),m_creature->GetPositionZ());
		unit_on_me = caster;
		DoCast(m_creature,SPELL_MOVE_MARKER);
	}
}
};
struct TRINITY_DLL_DECL chess_npcAI : public Scripted_NoMovementAI
{
	Creature *npc_medivh;
	bool sendedtohome;
	bool isInGame;
	bool canmove;
	uint32 original_faction_of_player;
	Unit *creaturecharmer;
	uint64 medivhGUID;
	ScriptedInstance* pInstance;
	uint32 healtimer;
	uint32 move_timer;
	std::list<Unit *> PossibleMoveUnits;
    uint64 playerGUID;
	chess_npcAI(Creature *c) : Scripted_NoMovementAI(c)
	{
		pInstance = ((ScriptedInstance*)m_creature->GetInstanceData());
	}
	void MoveInLineOfSight(Unit *who)
	{
        if( !m_creature->getVictim() && who->isTargetableForAttack() && ( m_creature->IsHostileTo( who )) && who->isInAccessiblePlaceFor(m_creature) )
		{
			if (!m_creature->canFly() && m_creature->GetDistanceZ(who) > CREATURE_Z_ATTACK_RANGE)
				return;

			if( m_creature->IsWithinDistInMap(who, NPC_ATTACK_RADIUS) && m_creature->IsWithinLOSInMap(who) && isInGame)
			{
				who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
				AttackStart(who);
                playerGUID = who->GetGUID();
			}
		}
	}
	void Aggro(Unit *Unit){
		medivhGUID = pInstance->GetData64(DATA_ECHO_OF_MEDIVH);
		npc_medivh = (Creature*)Unit::GetUnit(*m_creature,medivhGUID);
        Player* player = Unit::GetPlayer(playerGUID);
		if(npc_medivh && player){
                

            if (player->GetTeam() == ALLIANCE){
	            if(m_creature->GetEntry() == NPC_KING_H){
		            npc_medivh->Say(SAY_MEDIVH_CHECK,LANG_UNIVERSAL,NULL);
	            }else if(m_creature->GetEntry() == NPC_KING_A){
		            npc_medivh->Say(SAY_PLAYER_CHECK,LANG_UNIVERSAL,NULL);
	            }
			}else{
				if(m_creature->GetEntry() == NPC_KING_A){
					npc_medivh->Say(SAY_MEDIVH_CHECK,LANG_UNIVERSAL,NULL);
				}else if(m_creature->GetEntry() == NPC_KING_H){
					npc_medivh->Say(SAY_PLAYER_CHECK,LANG_UNIVERSAL,NULL);
				}
			}
		}
	}
	
	void Reset(){
		healtimer = 7000;
		sendedtohome = false;
		isInGame = true;
		canmove = true;
		move_timer = 3000; //we wait 3s with move
		m_creature->setActive(true);
        playerGUID = 0;
	}
	void JustRespawned(){
		//not finally - just a presentation - need 32place two side of chesstable
		float angle = m_creature->GetOrientation();
		float pos_x = -11066;
		float pos_y = -1898;
		int move_lenght = 2*rand()%10;
		float new_x = pos_x + move_lenght * cos(angle);
		float new_y = pos_y + move_lenght * sin(angle);
		m_creature->Relocate(new_x,new_y,221,2.24);
		m_creature->CombatStop();
		m_creature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);
	}
	void JustDied(Unit *Killer){
		isInGame = false;
		m_creature->setActive(false);
		m_creature->Respawn();
	}
	void OnPossess(bool Apply){
		if(Apply){
			original_faction_of_player = m_creature->GetCharmer()->getFaction();
			creaturecharmer = m_creature->GetCharmer();
			//very big haxx imho, need fix in posses patch(make creature attackable by *_Creature_faction)
            Player* player = Unit::GetPlayer(playerGUID);
            if (!player)
                return;
            if(player->GetTeam() == ALLIANCE){
				m_creature->setFaction(ALLI_CREATURE_FACTION);
				creaturecharmer->setFaction(ALLI_CREATURE_FACTION);
			}else{
				m_creature->setFaction(HORDE_CREATURE_FACTION);
				creaturecharmer->setFaction(HORDE_CREATURE_FACTION);
			}
		}else{
			creaturecharmer->setFaction(original_faction_of_player);
		}

	}
	void KilledUnit(Unit* victim){
		medivhGUID = pInstance->GetData64(DATA_ECHO_OF_MEDIVH);
		npc_medivh = (Creature*)Unit::GetUnit(*m_creature,medivhGUID);
        Player* player = Unit::GetPlayer(playerGUID);
		if(!npc_medivh || !player)
			return;

        if(player->GetTeam() == HORDE){
			switch(victim->GetEntry()){
				case NPC_ROOK_H: npc_medivh->Say(SAY_LOSE_ROOK_P,LANG_UNIVERSAL,NULL);break;
				case NPC_ROOK_A: npc_medivh->Say(SAY_LOSE_ROOK_M,LANG_UNIVERSAL,NULL);break;
				case NPC_QUEEN_H: npc_medivh->Say(SAY_LOSE_QUEEN_P,LANG_UNIVERSAL,NULL);break;
				case NPC_QUEEN_A: npc_medivh->Say(SAY_LOSE_QUEEN_M,LANG_UNIVERSAL,NULL);break;
				case NPC_BISHOP_H: npc_medivh->Say(SAY_LOSE_BISHOP_P,LANG_UNIVERSAL,NULL);break;
				case NPC_BISHOP_A: npc_medivh->Say(SAY_LOSE_BISHOP_M,LANG_UNIVERSAL,NULL);break;
				case NPC_KNIGHT_H: npc_medivh->Say(SAY_LOSE_KNIGHT_P,LANG_UNIVERSAL,NULL);break;
				case NPC_KNIGHT_A: npc_medivh->Say(SAY_LOSE_KNIGHT_M,LANG_UNIVERSAL,NULL);break;
				case NPC_PAWN_H: 
				switch(rand()%3){
				case 0:npc_medivh->Say(SAY_LOSE_PAWN_P_1,LANG_UNIVERSAL,NULL);break;
				case 1:npc_medivh->Say(SAY_LOSE_PAWN_P_2,LANG_UNIVERSAL,NULL);break;
				case 2:npc_medivh->Say(SAY_LOSE_PAWN_P_3,LANG_UNIVERSAL,NULL);break;
				}
				break;
				case NPC_PAWN_A:
				switch(rand()%2){
				case 0:npc_medivh->Say(SAY_LOSE_PAWN_M_1,LANG_UNIVERSAL,NULL);break;
				case 1:npc_medivh->Say(SAY_LOSE_PAWN_M_2,LANG_UNIVERSAL,NULL);break;
				}
				break;
				case NPC_KING_H:
				npc_medivh->Say(SAY_MEDIVH_WIN,LANG_UNIVERSAL,NULL);
				pInstance->SetData(DATA_CHESS_EVENT,FAIL);
				break;
				case NPC_KING_A: 
				npc_medivh->Say(SAY_PLAYER_WIN,LANG_UNIVERSAL,NULL);
				pInstance->SetData(DATA_CHESS_EVENT,DONE);
				npc_medivh->SummonGameObject(DUST_COVERED_CHEST,-11058,-1903,221,2.24,0,0,0,0,7200000);
				break;
				default:
				break;
			}
		}else{
			switch(victim->GetEntry()){
				case NPC_ROOK_A: npc_medivh->Say(SAY_LOSE_ROOK_P,LANG_UNIVERSAL,NULL);break;
				case NPC_ROOK_H: npc_medivh->Say(SAY_LOSE_ROOK_M,LANG_UNIVERSAL,NULL);break;
				case NPC_QUEEN_A: npc_medivh->Say(SAY_LOSE_QUEEN_P,LANG_UNIVERSAL,NULL);break;
				case NPC_QUEEN_H: npc_medivh->Say(SAY_LOSE_QUEEN_M,LANG_UNIVERSAL,NULL);break;
				case NPC_BISHOP_A: npc_medivh->Say(SAY_LOSE_BISHOP_P,LANG_UNIVERSAL,NULL);break;
				case NPC_BISHOP_H: npc_medivh->Say(SAY_LOSE_BISHOP_M,LANG_UNIVERSAL,NULL);break;
				case NPC_KNIGHT_A: npc_medivh->Say(SAY_LOSE_KNIGHT_P,LANG_UNIVERSAL,NULL);break;
				case NPC_KNIGHT_H: npc_medivh->Say(SAY_LOSE_KNIGHT_M,LANG_UNIVERSAL,NULL);break;
				case NPC_PAWN_A:
				switch(rand()%3){
				case 0:npc_medivh->Say(SAY_LOSE_PAWN_P_1,LANG_UNIVERSAL,NULL);break;
				case 1:npc_medivh->Say(SAY_LOSE_PAWN_P_2,LANG_UNIVERSAL,NULL);break;
				case 2:npc_medivh->Say(SAY_LOSE_PAWN_P_3,LANG_UNIVERSAL,NULL);break;
				}
				case NPC_PAWN_H:
				switch(rand()%2){
				case 0:npc_medivh->Say(SAY_LOSE_PAWN_M_1,LANG_UNIVERSAL,NULL);break;
				case 1:npc_medivh->Say(SAY_LOSE_PAWN_M_2,LANG_UNIVERSAL,NULL);break;
				}
				break;
				case NPC_KING_A:
				npc_medivh->Say(SAY_MEDIVH_WIN,LANG_UNIVERSAL,NULL);
				pInstance->SetData(DATA_CHESS_EVENT,FAIL);
				break;
				case NPC_KING_H: 
				npc_medivh->Say(SAY_PLAYER_WIN,LANG_UNIVERSAL,NULL);
				pInstance->SetData(DATA_CHESS_EVENT,DONE);
				npc_medivh->SummonGameObject(DUST_COVERED_CHEST,-11058,-1903,221,2.24,0,0,0,0,7200000);
				break;
				default:
				break;
			}
		}
		if(victim->isPossessed()){
			victim->RemoveCharmAuras();
		}		

	}
	std::list<Unit*> FindPossibleMoveUnits(){
		//need argument for strafe/forwardmove
	CellPair p(Trinity::ComputeCellPair(m_creature->GetPositionX(), m_creature->GetPositionY()));
    Cell cell(p);
    cell.data.Part.reserved = ALL_DISTRICT;
    cell.SetNoCreate();

    std::list<Unit*> pList;
	std::list<Unit*> returnList;
	float range = GetStrafeLenght(m_creature->GetEntry())*SEARCH_RANGE;

	Trinity::AnyUnitInObjectRangeCheck u_check(m_creature,range);
	Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck> searcher(pList, u_check);
    TypeContainerVisitor<Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

    CellLock<GridReadGuard> cell_lock(cell, p);
    cell_lock->Visit(cell_lock, grid_unit_searcher, *(m_creature->GetMap()));
	for(std::list<Unit *>::iterator itr = pList.begin(); itr != pList.end();itr++){
			if((*itr)->GetEntry() != TRIGGER_ID){
				continue;
			}
	returnList.push_back((*itr));
	}
	pList.clear();
    return returnList;
	}

	int GetStrafeLenght(uint32 Entry){
		if(Entry == NPC_QUEEN_H ||Entry == NPC_QUEEN_A)
			return 2;
		return 1;
	}
	void UpdateAI(const uint32 diff){

		if(pInstance->GetData(DATA_CHESS_EVENT) == DONE || pInstance->GetData(DATA_CHESS_EVENT) == FAIL){
			if(m_creature->isInCombat())
				m_creature->CombatStop();			

			if(m_creature->isPossessed())
				m_creature->RemoveCharmAuras();

			if(m_creature->HasFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE))
				m_creature->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NOT_SELECTABLE);

			if(!sendedtohome){
				m_creature->GetMotionMaster()->Clear();
				m_creature->GetMotionMaster()->MoveTargetedHome();
				sendedtohome = true;
			}
		}
		if(pInstance->GetData(DATA_CHESS_EVENT) != IN_PROGRESS)
			return;

		if(sendedtohome){ //for fail
			sendedtohome = false;
		}
		if(!isInGame)
			return;

		if(!m_creature->isPossessed()){
			if(!canmove){
				if(move_timer < diff){
					canmove = true;
					move_timer = 6000;
				}move_timer -= diff;
			}

			if(!m_creature->getVictim()){
				if(!canmove)
					return;

				PossibleMoveUnits = FindPossibleMoveUnits();
				if(PossibleMoveUnits.empty())
					return;
				std::list<Unit*>::iterator i = PossibleMoveUnits.begin();
				advance ( i ,rand()%PossibleMoveUnits.size());
				DoCast((*i),SPELL_MOVE_1);
				canmove = false;
			}
				
			switch(m_creature->GetEntry()){
				case NPC_ROOK_A:break;
				case NPC_ROOK_H:break;
				case NPC_QUEEN_A:break;
				case NPC_QUEEN_H:break;
				case NPC_BISHOP_A:
				if(healtimer <= diff){
					Unit *target = DoSelectLowestHpFriendly(25,5000); //dont select player controlled unit
					if(target)
					DoCast(target,BISHOP_HEAL_A);
					healtimer = 21000;
				}else healtimer -= diff;
				break;
				case NPC_BISHOP_H:
				if(healtimer <= diff){
					Unit *target = DoSelectLowestHpFriendly(25,5000); //dont select player controlled unit
					if(target)
					DoCast(target,BISHOP_HEAL_H);
					healtimer = 21000;
				}else healtimer -= diff;
				break;
				case NPC_KNIGHT_A:break;
				case NPC_KNIGHT_H:break;
				case NPC_PAWN_A:break;
				case NPC_PAWN_H:break;
				case NPC_KING_A:break;
				case NPC_KING_H:break;
				default:
				break;
			}
			if(m_creature->getVictim() || !m_creature->IsWithinDistInMap(m_creature->getVictim(), NPC_ATTACK_RADIUS)){
			m_creature->CombatStop();
			return;
		}
		}
		DoMeleeAttackIfReady();
	}
};
bool GossipHello_chess_npc(Player* player, Creature* _Creature)
{
	ScriptedInstance* pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());
	
	if(pInstance->GetData(DATA_CHESS_EVENT) != IN_PROGRESS)
		return true;
    if(player->GetTeam() == ALLIANCE && _Creature->getFaction() != ALLI_CREATURE_FACTION)
		return true;
	if(player->GetTeam() == HORDE && _Creature->getFaction() != HORDE_CREATURE_FACTION)
		return true;
	if(!_Creature->isPossessedByPlayer())
		 player->ADD_GOSSIP_ITEM(0, GOSSIP_POSSES, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
		 player->SEND_GOSSIP_MENU(8990, _Creature->GetGUID());
    return true;
}

bool GossipSelect_chess_npc(Player* player, Creature* _Creature, uint32 sender, uint32 action)
{
	if(action == GOSSIP_ACTION_INFO_DEF + 1){
		_Creature->SetCharmedOrPossessedBy(player, true);
		//player->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE);
		//_Creature->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_DISABLE_MOVE);
	}

    player->CLOSE_GOSSIP_MENU();
    return true;
}
bool GossipHello_npc_echo_of_medivh(Player* player, Creature* _Creature)
{
	ScriptedInstance* pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());
	if(pInstance->GetData(DATA_CHESS_EVENT) == FAIL){
		pInstance->SetData(DATA_CHESS_EVENT,NOT_STARTED);
	}
	if(pInstance->GetData(DATA_CHESS_EVENT) == DONE){ //for testing
		pInstance->SetData(DATA_CHESS_EVENT,NOT_STARTED); 
	}

	if(pInstance->GetData(DATA_CHESS_EVENT) != NOT_STARTED)
		return true;

	player->ADD_GOSSIP_ITEM(0, EVENT_START, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
	player->SEND_GOSSIP_MENU(8990, _Creature->GetGUID());
	//_Creature->GetNpcTextId()
	return true;
}

bool GossipSelect_npc_echo_of_medivh(Player* player, Creature* _Creature, uint32 sender, uint32 action)
{
	ScriptedInstance* pInstance = ((ScriptedInstance*)_Creature->GetInstanceData());

	if(action == GOSSIP_ACTION_INFO_DEF + 1)
	{
		_Creature->Say(SAY_AT_EVENT_START,LANG_UNIVERSAL,NULL);
		pInstance->SetData(DATA_CHESS_EVENT,IN_PROGRESS);
		//pInstance->SetData(CHESS_EVENT_TEAM,player->GetTeam());
		_Creature->GetMotionMaster()->MoveConfused();
		//player->TeleportTo(-11054.032,-1909.979,229.626,2.190);
	}

    player->CLOSE_GOSSIP_MENU();
    return true;
}

CreatureAI* GetAI_chess_npc(Creature *_Creature)
{
    return new chess_npcAI (_Creature);
}
CreatureAI* GetAI_move_trigger(Creature *_Creature){
	return new move_triggerAI (_Creature);
}

void AddSC_chess_event(){

    Script* newscript;

    newscript = new Script;
    newscript->GetAI = GetAI_chess_npc;
    newscript->Name = "chess_npc";
    newscript->pGossipHello = GossipHello_chess_npc;
    newscript->pGossipSelect = GossipSelect_chess_npc;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_echo_of_medivh";
    newscript->pGossipHello = GossipHello_npc_echo_of_medivh;
    newscript->pGossipSelect = GossipSelect_npc_echo_of_medivh;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "chess_move_trigger";
    newscript->GetAI = GetAI_move_trigger;
    newscript->RegisterSelf();
}
/*
UPDATE creature_template SET spell3=37462, spell4=37465 WHERE entry=21683;
UPDATE creature_template SET spell2=37148, spell3=37471, spell4=37474 WHERE entry=21684;
UPDATE creature_template SET spell2=37152, spell3=37455, spell4=37459 WHERE entry=21682;
UPDATE creature_template SET spell1=30284, spell2=37144, spell3=37453, spell4=37498 WHERE entry=21664;
UPDATE creature_template SET spell2=37151, spell3=37427, spell4=37432 WHERE entry=21160;
UPDATE creature_template SET spell2=37146, spell3=37406, spell4=37414 WHERE entry=17211;
UPDATE creature_template SET spell3=37472, spell4=37476 WHERE entry=21752;
UPDATE creature_template SET spell3=37463, spell4=37461 WHERE entry=21750;
UPDATE creature_template SET spell2=37152, spell3=37456, spell4=37461 WHERE entry=21747;
UPDATE creature_template SET spell1=30284, spell2=37144, spell3=37454, spell4=37502 WHERE entry=21748;
UPDATE creature_template SET spell2=37151, spell3=37434, spell4=37428 WHERE entry=21726;
UPDATE creature_template SET spell2=37146, spell3=37413, spell4=37416 WHERE entry=17469;

update creature_template set scriptname = "chess_npc" where entry in (17469,17211,21748,21664,21750,21683,21747,21682,21726,21160,21752,21684);
update creature_template set scriptname = "npc_echo_of_medivh" where entry = 16816;
update creature_template set scriptname = "chess_move_trigger" where entry = 22519;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (NULL, 16816, 532, 1, 0, 0, -11074, -1853.28, 220.667, 3.84199, 7200, 0, 0, 50000, 0, 0, 0);

Triggers

UPDATE creature SET position_x = '-11089.131836', position_y = '-1841.463867', position_z = '221.070999', orientation = '5.734146' WHERE guid = '1523302';
DELETE FROM creature WHERE guid = '1523981';
INSERT INTO creature VALUES (1523981,22519,532,1,0,0,-11078.3,-1848.74,220.668,5.41802,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523983';
INSERT INTO creature VALUES (1523983,22519,532,1,0,0,-11074.1,-1853.58,220.668,5.41802,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523985';
INSERT INTO creature VALUES (1523985,22519,532,1,0,0,-11070.8,-1857.51,220.668,5.41802,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523987';
INSERT INTO creature VALUES (1523987,22519,532,1,0,0,-11067.3,-1861.65,220.668,5.41802,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523989';
INSERT INTO creature VALUES (1523989,22519,532,1,0,0,-11063.7,-1865.84,220.668,3.81895,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523991';
INSERT INTO creature VALUES (1523991,22519,532,1,0,0,-11059.8,-1870.83,220.668,2.84192,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523993';
INSERT INTO creature VALUES (1523993,22519,532,1,0,0,-11057.6,-1874.61,220.668,5.64108,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523995';
INSERT INTO creature VALUES (1523995,22519,532,1,0,0,-11054.6,-1878.95,220.668,5.78481,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523997';
INSERT INTO creature VALUES (1523997,22519,532,1,0,0,-11057.8,-1882.23,220.668,4.60357,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1523999';
INSERT INTO creature VALUES (1523999,22519,532,1,0,0,-11060.7,-1878.66,220.668,3.86529,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524001';
INSERT INTO creature VALUES (1524001,22519,532,1,0,0,-11064,-1874.8,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524003';
INSERT INTO creature VALUES (1524003,22519,532,1,0,0,-11067.7,-1870.41,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524005';
INSERT INTO creature VALUES (1524005,22519,532,1,0,0,-11070.8,-1866.71,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524007';
INSERT INTO creature VALUES (1524007,22519,532,1,0,0,-11070.8,-1866.71,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524009';
INSERT INTO creature VALUES (1524009,22519,532,1,0,0,-11074.7,-1862.17,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524011';
INSERT INTO creature VALUES (1524011,22519,532,1,0,0,-11078.4,-1857.76,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524013';
INSERT INTO creature VALUES (1524013,22519,532,1,0,0,-11082,-1853.61,220.668,2.27464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524015';
INSERT INTO creature VALUES (1524015,22519,532,1,0,0,-11085.3,-1855.97,220.668,2.65478,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524017';
INSERT INTO creature VALUES (1524017,22519,532,1,0,0,-11082.7,-1859.65,220.668,5.33141,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524019';
INSERT INTO creature VALUES (1524019,22519,532,1,0,0,-11079.6,-1864.03,220.668,5.33141,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524021';
INSERT INTO creature VALUES (1524021,22519,532,1,0,0,-11075.6,-1869.63,220.668,5.33141,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524023';
INSERT INTO creature VALUES (1524023,22519,532,1,0,0,-11072.5,-1873.48,220.668,5.45394,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524025';
INSERT INTO creature VALUES (1524025,22519,532,1,0,0,-11069.4,-1877.84,220.668,5.83485,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524027';
INSERT INTO creature VALUES (1524027,22519,532,1,0,0,-11066.3,-1881.92,220.668,6.2464,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524029';
INSERT INTO creature VALUES (1524029,22519,532,1,0,0,-11062.2,-1886.33,220.668,5.39896,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524031';
INSERT INTO creature VALUES (1524031,22519,532,1,0,0,-11066,-1889.75,220.668,3.75669,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524033';
INSERT INTO creature VALUES (1524033,22519,532,1,0,0,-11069.5,-1885.3,220.668,2.2393,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524035';
INSERT INTO creature VALUES (1524035,22519,532,1,0,0,-11072.8,-1881.1,220.668,2.2393,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524037';
INSERT INTO creature VALUES (1524037,22519,532,1,0,0,-11076.5,-1876.47,220.668,2.2393,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524039';
INSERT INTO creature VALUES (1524039,22519,532,1,0,0,-11079.3,-1872.86,220.668,2.2393,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524041';
INSERT INTO creature VALUES (1524041,22519,532,1,0,0,-11082.8,-1868.5,220.668,2.2393,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524043';
INSERT INTO creature VALUES (1524043,22519,532,1,0,0,-11086.6,-1864.39,220.668,2.17882,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524045';
INSERT INTO creature VALUES (1524045,22519,532,1,0,0,-11090.3,-1860.19,220.668,2.33983,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524047';
INSERT INTO creature VALUES (1524047,22519,532,1,0,0,-11094.8,-1863.03,220.668,3.57369,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524049';
INSERT INTO creature VALUES (1524049,22519,532,1,0,0,-11091.4,-1866.6,220.668,5.12564,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524051';
INSERT INTO creature VALUES (1524051,22519,532,1,0,0,-11087.7,-1870.88,220.668,4.99919,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524053';
INSERT INTO creature VALUES (1524053,22519,532,1,0,0,-11084.8,-1875.5,220.668,5.41388,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524055';
INSERT INTO creature VALUES (1524055,22519,532,1,0,0,-11080.7,-1880.27,220.668,5.41388,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524057';
INSERT INTO creature VALUES (1524057,22519,532,1,0,0,-11077.4,-1884.23,220.668,5.41388,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524059';
INSERT INTO creature VALUES (1524059,22519,532,1,0,0,-11074.2,-1888.1,220.668,5.32199,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524061';
INSERT INTO creature VALUES (1524061,22519,532,1,0,0,-11071,-1892.7,220.668,5.32199,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524063';
INSERT INTO creature VALUES (1524063,22519,532,1,0,0,-11075.2,-1896.22,220.668,4.93793,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524065';
INSERT INTO creature VALUES (1524065,22519,532,1,0,0,-11078.9,-1892.13,220.668,2.29899,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524067';
INSERT INTO creature VALUES (1524067,22519,532,1,0,0,-11081.5,-1888.96,220.668,2.15055,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524069';
INSERT INTO creature VALUES (1524069,22519,532,1,0,0,-11084.8,-1883.69,220.668,2.35554,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524071';
INSERT INTO creature VALUES (1524071,22519,532,1,0,0,-11088.2,-1879.71,220.668,2.24951,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524073';
INSERT INTO creature VALUES (1524073,22519,532,1,0,0,-11092.5,-1874.34,220.668,2.24951,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524075';
INSERT INTO creature VALUES (1524075,22519,532,1,0,0,-11095.2,-1870.99,220.668,2.24951,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524077';
INSERT INTO creature VALUES (1524077,22519,532,1,0,0,-11098.7,-1866.69,220.668,2.24951,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524079';
INSERT INTO creature VALUES (1524079,22519,532,1,0,0,-11103.7,-1869.11,220.668,3.68443,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524081';
INSERT INTO creature VALUES (1524081,22519,532,1,0,0,-11099.7,-1873.42,220.668,5.28979,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524083';
INSERT INTO creature VALUES (1524083,22519,532,1,0,0,-11096.5,-1878.36,220.668,5.28979,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524085';
INSERT INTO creature VALUES (1524085,22519,532,1,0,0,-11093.2,-1881.88,220.668,4.65519,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524087';
INSERT INTO creature VALUES (1524087,22519,532,1,0,0,-11089.8,-1886.71,220.668,5.3212,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524089';
INSERT INTO creature VALUES (1524089,22519,532,1,0,0,-11086.8,-1891.13,220.668,5.3212,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524091';
INSERT INTO creature VALUES (1524091,22519,532,1,0,0,-11083.2,-1895.54,220.668,4.9984,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524093';
INSERT INTO creature VALUES (1524093,22519,532,1,0,0,-11080.1,-1900.17,220.668,5.50185,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524095';
INSERT INTO creature VALUES (1524095,22519,532,1,0,0,-11082.9,-1902.83,220.668,3.9122,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524097';
INSERT INTO creature VALUES (1524097,22519,532,1,0,0,-11085.8,-1899.68,220.668,2.41287,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524099';
INSERT INTO creature VALUES (1524099,22519,532,1,0,0,-11089.9,-1895.41,220.668,2.29978,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524101';
INSERT INTO creature VALUES (1524101,22519,532,1,0,0,-11094.3,-1890.5,220.668,2.29978,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524103';
INSERT INTO creature VALUES (1524103,22519,532,1,0,0,-11097.1,-1886.43,220.668,2.31705,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524105';
INSERT INTO creature VALUES (1524105,22519,532,1,0,0,-11100.5,-1881.81,220.668,2.46314,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524107';
INSERT INTO creature VALUES (1524107,22519,532,1,0,0,-11103.5,-1877.88,220.668,2.22124,25,0,0,8,0,0,0);
DELETE FROM creature WHERE guid = '1524109';
INSERT INTO creature VALUES (1524109,22519,532,1,0,0,-11107.4,-1873.91,220.668,2.43565,25,0,0,8,0,0,0);

*/
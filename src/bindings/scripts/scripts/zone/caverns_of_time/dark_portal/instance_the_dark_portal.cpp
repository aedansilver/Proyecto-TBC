/* Copyright (C) 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

#include "precompiled.h" 
#include "def_the_dark_portal.h"
 
struct TRINITY_DLL_DECL instance_the_dark_portal : public ScriptedInstance
{
    instance_the_dark_portal(Map *Map) : ScriptedInstance(Map) {Initialize();};
 
    uint64 Medivh;
    uint32 IsMedivhDead;
    uint32 IsChronoLordDejaDead;
    uint32 IsTemporusDead;
    uint32 IsAeonusDead;
    uint32 Wave;
    uint32 ShieldPercent;
 
    void Initialize()
    {
        Medivh = 0;
        IsMedivhDead = 0;
        IsChronoLordDejaDead = 0;
        IsTemporusDead = 0;
        IsAeonusDead = 0;
        Wave = 0;
        ShieldPercent = 100;
    }

	bool IsEncounterInProgress()
	{
		return (!IsAeonusDead);
	}
 
    void OnCreatureCreate(Creature *creature, uint32 creature_entry)
    {
        switch(creature_entry)
        {
            case 15608:
                Medivh = creature->GetGUID();
                break;
        }
    }
 
    uint64 GetData64(uint32 identifier)
    {
        if (identifier == DATA_MEDIVH)
            return Medivh;
        return 0;
    }
 
    uint32 GetData(uint32 type)
    { 
        if(type == DATA_MEDIVHDEATH)
            return IsMedivhDead;
        if(type == DATA_CHRONOLORDDEJADEATH)
            return IsChronoLordDejaDead;
        if(type == DATA_TEMPORUSDEATH)
            return IsTemporusDead;
        if(type == DATA_AEONUSDEATH)
            return IsAeonusDead;
        /*if(type == DATA_WAVE)
            return Wave;*/
        if(type == DATA_SHIELDPERCENT)
            return ShieldPercent;
        return 0;
    }
 
    void SetData(uint32 type, uint32 data)
    {
        if(type == DATA_MEDIVHDEATH)
            IsMedivhDead = data;
        else if(type == DATA_CHRONOLORDDEJADEATH)
            IsChronoLordDejaDead = data;
        else if(type == DATA_TEMPORUSDEATH)
            IsTemporusDead = data;
        else if(type == DATA_AEONUSDEATH)
            IsAeonusDead = data;
        /*else if(type == DATA_WAVE)
            Wave = data;*/
        else if(type == DATA_SHIELDPERCENT)
            ShieldPercent = data;
    }
};
 
InstanceData* GetInstanceData_instance_the_dark_portal(Map* map)
{
    return new instance_the_dark_portal(map);
}
 
void AddSC_instance_the_dark_portal()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_the_dark_portal";
    newscript->GetInstanceData = GetInstanceData_instance_the_dark_portal;
    newscript->RegisterSelf();
}

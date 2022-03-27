#include "ChatCommandCommon.as"
#include "ChatCommandManager.as"

class ChatCommand
{
	string[] aliases;
	string description;
	bool modOnly = false;
	bool debugOnly = false;

	ChatCommand(string name, string description)
	{
		aliases.push_back(name);
		this.description = description;
	}

	void AddAlias(string name)
	{
		aliases.push_back(name);
	}

	void SetModOnly()
	{
		modOnly = true;
	}

	void SetDebugOnly()
	{
		debugOnly = true;
	}

	bool canPlayerExecute(CPlayer@ player)
	{
		return (
			(!modOnly || player.isMod()) &&
			(!debugOnly || getRules().get_bool("sv_test"))
		);
	}

	void Execute(string[] args, CPlayer@ player) {}
}

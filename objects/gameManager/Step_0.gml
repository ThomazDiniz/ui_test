if (InputPressed(INPUT_VERB.TOGGLE_INVENTORY)){
	GetInventory().Toggle();
}

if (InputPressed(INPUT_VERB.ACTION)){
	GetInventory().UseItem();
}


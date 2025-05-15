function InventoryManager() constructor {
  animation = 0;
  x = 60;
  y = 60;

  isOpen = false;
  items = [];
  selectedIndex = -1;
  selectedItem = noone;

  inventorySize = 64;
  inventoryMargin = 8;
  columns = 5;
  rows = 3;
  totalSlots = columns * rows;

  Toggle = function() {
    animation = 0;
    isOpen = !isOpen;
  };

  UseItem = function(_index = selectedIndex) {
    if (_index >= 0 && _index < array_length(items)) {
      var _item = items[_index];
      _item.Use();
    }
  };

  AddItem = function(_item) {
    if (array_length(items) < inventorySize) {
      array_push(items, _item);
    } else {
      show_debug_message("Sem espaço para adicionar mais itens!");
    }
  };

  Draw = function() {
    if (isOpen) {
      var _mouseX = InputMouseGuiX();
      var _mouseY = InputMouseGuiY();

      var _gridMargin = 8;
      var _gridSize = 96;
      var _columns = 5;
      var _rows = 3;
      var _gridWidth = (_gridSize + _gridMargin) * _columns;
      var _gridHeight = (_gridSize + _gridMargin) * _rows;

      var _x = x;
      var _y = y;

      var _inventoryBoxWidth = 164;
      var _inventoryBoxHeight = 32;
      var _inventoryBoxMargin = 32;

      // Header box
      draw_sprite_stretched(lt_box_9slice, 0, _x, _y, _inventoryBoxWidth, _inventoryBoxHeight);
      draw_sprite_stretched(w_box_9slice, 0, _x + 2, _y + 2, 32, _inventoryBoxHeight - 4);
      draw_sprite_stretched(basket, 0, _x + 2, _y, 32, _inventoryBoxHeight - 4);

      draw_set_color(c_black);
      draw_text(_x + 64, _y + 4, "Inventory");
      draw_set_color(c_white);

      // Item detail box
      _x = x;
      _y = y + _inventoryBoxHeight + _inventoryBoxMargin;
      var _inventoryItemBoxWidth = 164;
      var _inventoryItemBoxHeight = 180;

      draw_sprite_stretched(w_box_9slice, 0, _x, _y, _inventoryItemBoxWidth, _inventoryItemBoxHeight);

      if (selectedItem != noone) {
        draw_text(_x + 4, _y + 4, selectedItem.name);
      }

      // Buy button
      _x = x;
      _y += _inventoryItemBoxHeight + _inventoryBoxMargin;
      var _inventoryBuyWidth = 164;
      var _inventoryBuyHeight = 32;

      draw_sprite_stretched(lt_box_9slice, 0, _x, _y, _inventoryBuyWidth, _inventoryBuyHeight);
      draw_sprite_stretched(w_box_9slice, 0, _x + 64, _y, 32, 32);

      draw_set_color(c_black);
      draw_text(_x + 4, _y + 4, "Buy");
      draw_text(_x + 70, _y + 5, "20");

      if (selectedItem != noone) {
        draw_text(_x + 120, _y + 4, selectedItem.price);
      }
      draw_set_color(c_white);

      // Inventory grid
      _x = x + _inventoryBoxWidth + _inventoryBoxMargin;
      _y = y;

      draw_sprite_stretched(dt_box_9slice, 0, _x, _y, _gridWidth, _gridHeight);

      _x += _gridMargin * 0.5;
      _y += _gridMargin * 0.5;

      var _index = 0;
      var _xStart = _x;

      for (var _i = 0; _i < _rows; _i++) {
        for (var _j = 0; _j < _columns; _j++) {
          if (_index < array_length(items)) {
            if (_index == selectedIndex) {
              draw_set_alpha(1);
            } else {
              draw_set_alpha(0.7);
            }

            draw_sprite_stretched(lt_box_9slice, 0, _x, _y, _gridSize, _gridSize);

            var _item = items[_index];
            draw_sprite_ext(_item.sprite, 0, _x + 24, _y + 10, 4, 4, 0, c_white, 1);

            if (mouse_check_button_pressed(mb_left)) {
              if (point_in_rectangle(_mouseX, _mouseY, _x, _y, _x + _gridSize, _y + _gridSize)) {
                selectedItem = _item;
                selectedIndex = _index;
              }
            }
          } else {
            draw_set_alpha(0.4);
            draw_sprite_stretched(lt_box_9slice, 0, _x, _y, _gridSize, _gridSize);
          }

          draw_set_alpha(1);

          _x += _gridSize + _gridMargin;
          _index++;
        }

        _x = _xStart;
        _y += _gridSize + _gridMargin;
      }
    }
  };
}

function GetInventory() {
  static __singleton = undefined;
  if (__singleton == undefined) {
    __singleton = new InventoryManager();
  }
  return __singleton;
}

function Item(_name, _sprite, _description, _price, _callback) {
  return {
    name: _name,
    sprite: _sprite,
    description: _description,
    callback: _callback,
    price: _price,

    Use: function() {
      show_debug_message("Using " + name);
      callback();
    }
  };
}

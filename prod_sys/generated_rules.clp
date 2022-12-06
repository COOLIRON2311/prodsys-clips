
(defrule clear-message
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?sendmessage <- (sendmessagehalt ?msg)
	=>
	(retract ?clear-msg-flg)
	(retract ?sendmessage)
)

(deftemplate item
(slot name (default none))
(slot conf (type FLOAT) (default 0.0))
)

(defrule combine
(declare (salience 60))
?i1 <- (item (name ?f1) (conf ?conf1))
?i2 <- (item (name ?f2) (conf ?conf2))
=>
(if (and (eq ?f1 ?f2) (!= ?conf1 ?conf2)) then
(assert  (item (name ?f1) (conf (- (+ ?conf1 ?conf2) (* ?conf1 ?conf2)))))
(retract ?i1)
(retract ?i2)
(assert ( sendmessagehalt (sym-cat ?f1 ": Conf was recalculated")) )
(halt))
)

(defrule r1
(declare (salience 50))
(item (name f1) (conf ?c0))
=>
(assert (item (name f2) (conf (* 0.90 (min ?c0)) ) ) )
(assert (sendmessagehalt "f2: Wood -> Planks"))
(halt)
)

(defrule r2
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f3) (conf (* 0.88 (min ?c0)) ) ) )
(assert (sendmessagehalt "f3: Planks -> Stick"))
(halt)
)

(defrule r3
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f4) (conf (* 0.85 (min ?c0)) ) ) )
(assert (sendmessagehalt "f4: Planks -> Workbench"))
(halt)
)

(defrule r4
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f5) (conf (* 0.80 (min ?c0)) ) ) )
(assert (sendmessagehalt "f5: Planks -> Chest"))
(halt)
)

(defrule r5
(declare (salience 50))
(item (name f6) (conf ?c0))
=>
(assert (item (name f7) (conf (* 0.79 (min ?c0)) ) ) )
(assert (sendmessagehalt "f7: Stone -> Furnace"))
(halt)
)

(defrule r6
(declare (salience 50))
(item (name f3) (conf ?c0))
=>
(assert (item (name f8) (conf (* 0.50 (min ?c0)) ) ) )
(assert (sendmessagehalt "f8: Stick -> Ladder"))
(halt)
)

(defrule r7
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f9) (conf (* 0.40 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f9: Planks, Stick -> Fence"))
(halt)
)

(defrule r8
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f10) (conf (* 0.37 (min ?c0)) ) ) )
(assert (sendmessagehalt "f10: Planks -> Boat"))
(halt)
)

(defrule r9
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f11) (conf (* 0.32 (min ?c0)) ) ) )
(assert (sendmessagehalt "f11: Planks -> Wooden Slabs"))
(halt)
)

(defrule r10
(declare (salience 50))
(item (name f6) (conf ?c0))
=>
(assert (item (name f12) (conf (* 0.41 (min ?c0)) ) ) )
(assert (sendmessagehalt "f12: Stone -> Stone Slabs"))
(halt)
)

(defrule r11
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f13) (conf (* 0.29 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f13: Planks, Stick -> Sign"))
(halt)
)

(defrule r12
(declare (salience 50))
(item (name f2) (conf ?c0))
=>
(assert (item (name f14) (conf (* 0.44 (min ?c0)) ) ) )
(assert (sendmessagehalt "f14: Planks -> Wooden Door"))
(halt)
)

(defrule r13
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f16) (conf (* 0.22 (min ?c0)) ) ) )
(assert (sendmessagehalt "f16: Iron Ingot -> Iron Door"))
(halt)
)

(defrule r14
(declare (salience 50))
(item (name f17) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f18) (conf (* 0.24 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f18: Stick, Wool -> Painting"))
(halt)
)

(defrule r15
(declare (salience 50))
(item (name f17) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f19) (conf (* 0.76 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f19: Planks, Wool -> Bed"))
(halt)
)

(defrule r16
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f24) (conf (* 0.54 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f24: Planks, Stick -> Wooden Pickaxe"))
(halt)
)

(defrule r17
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f6) (conf ?c1))
=>
(assert (item (name f25) (conf (* 0.67 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f25: Planks, Stone -> Stone Pickaxe"))
(halt)
)

(defrule r18
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f26) (conf (* 0.72 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f26: Planks, Iron Ingot -> Iron Pickaxe"))
(halt)
)

(defrule r19
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f21) (conf ?c1))
=>
(assert (item (name f27) (conf (* 0.19 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f27: Planks, Gold Ingot -> Golden Pickaxe"))
(halt)
)

(defrule r20
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f22) (conf ?c1))
=>
(assert (item (name f28) (conf (* 0.78 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f28: Planks, Diamond -> Diamond Pickaxe"))
(halt)
)

(defrule r21
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f29) (conf (* 0.36 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f29: Planks, Stick -> Wooden Shovel"))
(halt)
)

(defrule r22
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f6) (conf ?c1))
=>
(assert (item (name f30) (conf (* 0.61 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f30: Stick, Stone -> Stone Shovel"))
(halt)
)

(defrule r23
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f31) (conf (* 0.72 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f31: Stick, Iron Ingot -> Iron Shovel"))
(halt)
)

(defrule r24
(declare (salience 50))
(item (name f21) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f32) (conf (* 0.13 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f32: Stick, Gold Ingot -> Golden Shovel"))
(halt)
)

(defrule r25
(declare (salience 50))
(item (name f22) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f33) (conf (* 0.31 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f33: Stick, Diamond -> Diamond Shovel"))
(halt)
)

(defrule r26
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f34) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f34: Planks, Stick -> Wooden Axe"))
(halt)
)

(defrule r27
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f6) (conf ?c1))
=>
(assert (item (name f35) (conf (* 0.70 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f35: Stick, Stone -> Stone Axe"))
(halt)
)

(defrule r28
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f36) (conf (* 0.88 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f36: Stick, Iron Ingot -> Iron Axe"))
(halt)
)

(defrule r29
(declare (salience 50))
(item (name f21) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f37) (conf (* 0.11 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f37: Stick, Gold Ingot -> Golden Axe"))
(halt)
)

(defrule r30
(declare (salience 50))
(item (name f22) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f38) (conf (* 0.65 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f38: Stick, Diamond -> Diamond Axe"))
(halt)
)

(defrule r31
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f39) (conf (* 0.55 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f39: Planks, Stick -> Wooden Hoe"))
(halt)
)

(defrule r32
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f6) (conf ?c1))
=>
(assert (item (name f40) (conf (* 0.83 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f40: Stick, Stone -> Stone Hoe"))
(halt)
)

(defrule r33
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f41) (conf (* 0.68 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f41: Stick, Iron Ingot -> Iron Hoe"))
(halt)
)

(defrule r34
(declare (salience 50))
(item (name f21) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f42) (conf (* 0.09 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f42: Stick, Gold Ingot -> Golden Hoe"))
(halt)
)

(defrule r35
(declare (salience 50))
(item (name f22) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f43) (conf (* 0.34 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f43: Stick, Diamond -> Diamond Hoe"))
(halt)
)

(defrule r36
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f44) (conf (* 0.85 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f44: Planks, Stick -> Wooden Sword"))
(halt)
)

(defrule r37
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f6) (conf ?c1))
=>
(assert (item (name f45) (conf (* 0.88 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f45: Stick, Stone -> Stone Sword"))
(halt)
)

(defrule r38
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f46) (conf (* 0.92 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f46: Stick, Iron Ingot -> Iron Sword"))
(halt)
)

(defrule r39
(declare (salience 50))
(item (name f21) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f47) (conf (* 0.62 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f47: Stick, Gold Ingot -> Golden Sword"))
(halt)
)

(defrule r40
(declare (salience 50))
(item (name f22) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f48) (conf (* 0.86 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f48: Stick, Diamond -> Diamond Sword"))
(halt)
)

(defrule r41
(declare (salience 50))
(item (name f103) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f50) (conf (* 0.73 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f50: Stick, String -> Fishing Rod"))
(halt)
)

(defrule r42
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f51) (conf ?c1))
=>
(assert (item (name f52) (conf (* 0.66 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f52: Iron Ingot, Flint -> Flint and Steel"))
(halt)
)

(defrule r43
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f53) (conf (* 0.78 (min ?c0)) ) ) )
(assert (sendmessagehalt "f53: Iron Ingot -> Shears"))
(halt)
)

(defrule r44
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f54) (conf (* 0.85 (min ?c0)) ) ) )
(assert (sendmessagehalt "f54: Iron Ingot -> Bucket"))
(halt)
)

(defrule r45
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f55) (conf (* 0.52 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f55: Stick, Iron Ingot -> Track"))
(halt)
)

(defrule r46
(declare (salience 50))
(item (name f20) (conf ?c0))
(item (name f21) (conf ?c1))
=>
(assert (item (name f56) (conf (* 0.27 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f56: Redstone, Gold Ingot -> Clock"))
(halt)
)

(defrule r47
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f57) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f57: Iron Ingot, Redstone -> Compass"))
(halt)
)

(defrule r48
(declare (salience 50))
(item (name f58) (conf ?c0))
=>
(assert (item (name f59) (conf (* 0.82 (min ?c0)) ) ) )
(assert (sendmessagehalt "f59: Sugar Cane -> Paper"))
(halt)
)

(defrule r49
(declare (salience 50))
(item (name f49) (conf ?c0))
(item (name f59) (conf ?c1))
=>
(assert (item (name f75) (conf (* 0.79 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f75: Leather, Paper -> Book"))
(halt)
)

(defrule r50
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f61) (conf (* 0.41 (min ?c0)) ) ) )
(assert (sendmessagehalt "f61: Iron Ingot -> Iron Bars"))
(halt)
)

(defrule r51
(declare (salience 50))
(item (name f22) (conf ?c0))
(item (name f62) (conf ?c1))
(item (name f75) (conf ?c2))
=>
(assert (item (name f63) (conf (* 0.78 (min ?c0 ?c1 ?c2)) ) ) )
(assert (sendmessagehalt "f63: Diamond, Obsidian, Book -> Enchantment Table"))
(halt)
)

(defrule r52
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f75) (conf ?c1))
=>
(assert (item (name f64) (conf (* 0.85 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f64: Planks, Book -> Bookshelf"))
(halt)
)

(defrule r53
(declare (salience 50))
(item (name f1) (conf ?c0))
(item (name f23) (conf ?c1))
(item (name f3) (conf ?c2))
=>
(assert (item (name f65) (conf (* 0.38 (min ?c0 ?c1 ?c2)) ) ) )
(assert (sendmessagehalt "f65: Wood, Stick, Coal -> Campfire"))
(halt)
)

(defrule r54
(declare (salience 50))
(item (name f11) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f66) (conf (* 0.40 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f66: Planks, Wooden Slabs -> Barrel"))
(halt)
)

(defrule r55
(declare (salience 50))
(item (name f1) (conf ?c0))
(item (name f7) (conf ?c1))
=>
(assert (item (name f67) (conf (* 0.33 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f67: Wood, Furnace -> Smoker"))
(halt)
)

(defrule r56
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f59) (conf ?c1))
=>
(assert (item (name f68) (conf (* 0.27 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f68: Planks, Paper -> Cartography Table"))
(halt)
)

(defrule r57
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f51) (conf ?c1))
=>
(assert (item (name f69) (conf (* 0.44 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f69: Planks, Flint -> Fletching Table"))
(halt)
)

(defrule r58
(declare (salience 50))
(item (name f11) (conf ?c0))
=>
(assert (item (name f70) (conf (* 0.36 (min ?c0)) ) ) )
(assert (sendmessagehalt "f70: Wooden Slabs -> Composter"))
(halt)
)

(defrule r59
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f71) (conf (* 0.42 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f71: Planks, Iron Ingot -> Smithing Table"))
(halt)
)

(defrule r60
(declare (salience 50))
(item (name f11) (conf ?c0))
(item (name f64) (conf ?c1))
=>
(assert (item (name f72) (conf (* 0.24 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f72: Wooden Slabs, Bookshelf -> Lectern"))
(halt)
)

(defrule r61
(declare (salience 50))
(item (name f103) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f73) (conf (* 0.17 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f73: Planks, String -> Loom"))
(halt)
)

(defrule r62
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f49) (conf ?c1))
=>
(assert (item (name f74) (conf (* 0.58 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f74: Stick, Leather -> Item Frame"))
(halt)
)

(defrule r63
(declare (salience 50))
(item (name f57) (conf ?c0))
(item (name f59) (conf ?c1))
=>
(assert (item (name f60) (conf (* 0.28 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f60: Compass, Paper -> Map"))
(halt)
)

(defrule r64
(declare (salience 50))
(item (name f49) (conf ?c0))
=>
(assert (item (name f76) (conf (* 0.43 (min ?c0)) ) ) )
(assert (sendmessagehalt "f76: Leather -> Leather Helmet"))
(halt)
)

(defrule r65
(declare (salience 50))
(item (name f49) (conf ?c0))
=>
(assert (item (name f77) (conf (* 0.58 (min ?c0)) ) ) )
(assert (sendmessagehalt "f77: Leather -> Leather Chestplate"))
(halt)
)

(defrule r66
(declare (salience 50))
(item (name f49) (conf ?c0))
=>
(assert (item (name f78) (conf (* 0.42 (min ?c0)) ) ) )
(assert (sendmessagehalt "f78: Leather -> Leather Leggings"))
(halt)
)

(defrule r67
(declare (salience 50))
(item (name f49) (conf ?c0))
=>
(assert (item (name f79) (conf (* 0.66 (min ?c0)) ) ) )
(assert (sendmessagehalt "f79: Leather -> Leather Boots"))
(halt)
)

(defrule r68
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f80) (conf (* 0.47 (min ?c0)) ) ) )
(assert (sendmessagehalt "f80: Iron Ingot -> Iron Helmet"))
(halt)
)

(defrule r69
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f81) (conf (* 0.61 (min ?c0)) ) ) )
(assert (sendmessagehalt "f81: Iron Ingot -> Iron Chestplate"))
(halt)
)

(defrule r70
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f82) (conf (* 0.50 (min ?c0)) ) ) )
(assert (sendmessagehalt "f82: Iron Ingot -> Iron Leggings"))
(halt)
)

(defrule r71
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f83) (conf (* 0.69 (min ?c0)) ) ) )
(assert (sendmessagehalt "f83: Iron Ingot -> Iron Boots"))
(halt)
)

(defrule r72
(declare (salience 50))
(item (name f21) (conf ?c0))
=>
(assert (item (name f84) (conf (* 0.20 (min ?c0)) ) ) )
(assert (sendmessagehalt "f84: Gold Ingot -> Golden Helmet"))
(halt)
)

(defrule r73
(declare (salience 50))
(item (name f21) (conf ?c0))
=>
(assert (item (name f85) (conf (* 0.22 (min ?c0)) ) ) )
(assert (sendmessagehalt "f85: Gold Ingot -> Golden Chestplate"))
(halt)
)

(defrule r74
(declare (salience 50))
(item (name f21) (conf ?c0))
=>
(assert (item (name f86) (conf (* 0.17 (min ?c0)) ) ) )
(assert (sendmessagehalt "f86: Gold Ingot -> Golden Leggings"))
(halt)
)

(defrule r75
(declare (salience 50))
(item (name f21) (conf ?c0))
=>
(assert (item (name f87) (conf (* 0.33 (min ?c0)) ) ) )
(assert (sendmessagehalt "f87: Gold Ingot -> Golden Boots"))
(halt)
)

(defrule r76
(declare (salience 50))
(item (name f22) (conf ?c0))
=>
(assert (item (name f88) (conf (* 0.58 (min ?c0)) ) ) )
(assert (sendmessagehalt "f88: Diamond -> Diamond Helmet"))
(halt)
)

(defrule r77
(declare (salience 50))
(item (name f22) (conf ?c0))
=>
(assert (item (name f89) (conf (* 0.67 (min ?c0)) ) ) )
(assert (sendmessagehalt "f89: Diamond -> Diamond Chestplate"))
(halt)
)

(defrule r78
(declare (salience 50))
(item (name f22) (conf ?c0))
=>
(assert (item (name f90) (conf (* 0.52 (min ?c0)) ) ) )
(assert (sendmessagehalt "f90: Diamond -> Diamond Leggings"))
(halt)
)

(defrule r79
(declare (salience 50))
(item (name f22) (conf ?c0))
=>
(assert (item (name f91) (conf (* 0.71 (min ?c0)) ) ) )
(assert (sendmessagehalt "f91: Diamond -> Diamond Boots"))
(halt)
)

(defrule r80
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f2) (conf ?c1))
=>
(assert (item (name f92) (conf (* 0.88 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f92: Planks, Iron Ingot -> Shield"))
(halt)
)

(defrule r81
(declare (salience 50))
(item (name f103) (conf ?c0))
(item (name f3) (conf ?c1))
=>
(assert (item (name f93) (conf (* 0.83 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f93: Stick, String -> Bow"))
(halt)
)

(defrule r82
(declare (salience 50))
(item (name f3) (conf ?c0))
(item (name f51) (conf ?c1))
(item (name f94) (conf ?c2))
=>
(assert (item (name f95) (conf (* 0.63 (min ?c0 ?c1 ?c2)) ) ) )
(assert (sendmessagehalt "f95: Stick, Flint, Feather -> Arrow"))
(halt)
)

(defrule r83
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f2) (conf ?c1))
(item (name f3) (conf ?c2))
=>
(assert (item (name f96) (conf (* 0.32 (min ?c0 ?c1 ?c2)) ) ) )
(assert (sendmessagehalt "f96: Planks, Stick, Iron Ingot -> Tripwire Hook"))
(halt)
)

(defrule r84
(declare (salience 50))
(item (name f103) (conf ?c0))
(item (name f15) (conf ?c1))
(item (name f3) (conf ?c2))
(item (name f96) (conf ?c3))
=>
(assert (item (name f97) (conf (* 0.67 (min ?c0 ?c1 ?c2 ?c3)) ) ) )
(assert (sendmessagehalt "f97: Stick, Iron Ingot, Tripwire Hook, String -> Crossbow"))
(halt)
)

(defrule r85
(declare (salience 50))
(item (name f21) (conf ?c0))
(item (name f98) (conf ?c1))
=>
(assert (item (name f99) (conf (* 0.65 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f99: Gold Ingot, Apple -> Golden Apple"))
(halt)
)

(defrule r86
(declare (salience 50))
(item (name f2) (conf ?c0))
(item (name f22) (conf ?c1))
=>
(assert (item (name f100) (conf (* 0.27 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f100: Planks, Diamond -> Jukebox"))
(halt)
)

(defrule r87
(declare (salience 50))
(item (name f15) (conf ?c0))
(item (name f2) (conf ?c1))
(item (name f20) (conf ?c2))
(item (name f6) (conf ?c3))
=>
(assert (item (name f101) (conf (* 0.46 (min ?c0 ?c1 ?c2 ?c3)) ) ) )
(assert (sendmessagehalt "f101: Planks, Stone, Iron Ingot, Redstone -> Piston"))
(halt)
)

(defrule r88
(declare (salience 50))
(item (name f15) (conf ?c0))
=>
(assert (item (name f102) (conf (* 0.39 (min ?c0)) ) ) )
(assert (sendmessagehalt "f102: Iron Ingot -> Minecart"))
(halt)
)

(defrule r89
(declare (salience 50))
(item (name f10) (conf ?c0))
(item (name f5) (conf ?c1))
=>
(assert (item (name f104) (conf (* 0.45 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f104: Chest, Boat -> Boat with Chest"))
(halt)
)

(defrule r91
(declare (salience 50))
(item (name f58) (conf ?c0))
=>
(assert (item (name f109) (conf (* 0.67 (min ?c0)) ) ) )
(assert (sendmessagehalt "f109: Sugar Cane -> Sugar"))
(halt)
)

(defrule r92
(declare (salience 50))
(item (name f112) (conf ?c0))
(item (name f21) (conf ?c1))
=>
(assert (item (name f113) (conf (* 0.54 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f113: Gold Ingot, Melon Slice -> Glistering Melon Slice"))
(halt)
)

(defrule r93
(declare (salience 50))
(item (name f111) (conf ?c0))
(item (name f116) (conf ?c1))
=>
(assert (item (name f117) (conf (* 0.57 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f117: Blaze Powder, Slimeball -> Magma Cream"))
(halt)
)

(defrule r94
(declare (salience 50))
(item (name f118) (conf ?c0))
(item (name f21) (conf ?c1))
=>
(assert (item (name f119) (conf (* 0.40 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f119: Gold Ingot, Carrot -> Golden Carrot"))
(halt)
)

(defrule r95
(declare (salience 50))
(item (name f109) (conf ?c0))
(item (name f114) (conf ?c1))
(item (name f123) (conf ?c2))
=>
(assert (item (name f124) (conf (* 0.69 (min ?c0 ?c1 ?c2)) ) ) )
(assert (sendmessagehalt "f124: Brown Mushroom, Sugar, Spider Eye -> Fermented Spider Eye"))
(halt)
)

(defrule r96
(declare (salience 50))
(item (name f105) (conf ?c0))
=>
(assert (item (name f126) (conf (* 0.72 (min ?c0)) ) ) )
(assert (sendmessagehalt "f126: Sand -> Glass"))
(halt)
)

(defrule r97
(declare (salience 50))
(item (name f126) (conf ?c0))
=>
(assert (item (name f127) (conf (* 0.59 (min ?c0)) ) ) )
(assert (sendmessagehalt "f127: Glass -> Glass Bottle"))
(halt)
)

(defrule r98
(declare (salience 50))
(item (name f125) (conf ?c0))
(item (name f127) (conf ?c1))
=>
(assert (item (name f128) (conf (* 0.84 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f128: Water, Glass Bottle -> Water Bottle"))
(halt)
)

(defrule r99
(declare (salience 50))
(item (name f106) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f129) (conf (* 0.80 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f129: Nether Wart, Water Bottle -> Awkward Potion"))
(halt)
)

(defrule r100
(declare (salience 50))
(item (name f107) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f130) (conf (* 0.48 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f130: Gunpowder, Water Bottle -> Splash Potion"))
(halt)
)

(defrule r101
(declare (salience 50))
(item (name f114) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.30 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Spider Eye, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r102
(declare (salience 50))
(item (name f120) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.33 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Ghast Tear, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r103
(declare (salience 50))
(item (name f110) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.47 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Rabbits Foot, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r104
(declare (salience 50))
(item (name f111) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.22 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Blaze Powder, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r105
(declare (salience 50))
(item (name f113) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.16 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Glistering Melon Slice, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r106
(declare (salience 50))
(item (name f109) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.66 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Sugar, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r107
(declare (salience 50))
(item (name f117) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Magma Cream, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r108
(declare (salience 50))
(item (name f128) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f131) (conf (* 0.42 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f131: Redstone, Water Bottle -> Mundane Potion"))
(halt)
)

(defrule r109
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f132) (conf (* 0.33 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f132: Glowstone Dust, Water Bottle -> Thick Potion"))
(halt)
)

(defrule r110
(declare (salience 50))
(item (name f109) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f133) (conf (* 0.70 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f133: Sugar, Awkward Potion -> Potion of Swiftness"))
(halt)
)

(defrule r111
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f133) (conf ?c1))
=>
(assert (item (name f134) (conf (* 0.44 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f134: Fermented Spider Eye, Potion of Swiftness -> Potion of Slowness"))
(halt)
)

(defrule r112
(declare (salience 50))
(item (name f110) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f135) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f135: Rabbits Foot, Awkward Potion -> Potion of Leaping"))
(halt)
)

(defrule r113
(declare (salience 50))
(item (name f111) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f136) (conf (* 0.63 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f136: Blaze Powder, Awkward Potion -> Potion of Strength"))
(halt)
)

(defrule r114
(declare (salience 50))
(item (name f113) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f137) (conf (* 0.79 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f137: Glistering Melon Slice, Awkward Potion -> Potion of Healing"))
(halt)
)

(defrule r115
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f137) (conf ?c1))
=>
(assert (item (name f138) (conf (* 0.31 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f138: Fermented Spider Eye, Potion of Healing -> Potion of Harming"))
(halt)
)

(defrule r116
(declare (salience 50))
(item (name f114) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f139) (conf (* 0.37 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f139: Spider Eye, Awkward Potion -> Potion of Poison"))
(halt)
)

(defrule r117
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f139) (conf ?c1))
=>
(assert (item (name f138) (conf (* 0.25 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f138: Fermented Spider Eye, Potion of Poison -> Potion of Harming"))
(halt)
)

(defrule r118
(declare (salience 50))
(item (name f120) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f140) (conf (* 0.68 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f140: Ghast Tear, Awkward Potion -> Potion of Regeneration"))
(halt)
)

(defrule r119
(declare (salience 50))
(item (name f117) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f141) (conf (* 0.52 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f141: Magma Cream, Awkward Potion -> Potion of Fire Resistance"))
(halt)
)

(defrule r120
(declare (salience 50))
(item (name f115) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f142) (conf (* 0.30 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f142: Pufferfish, Awkward Potion -> Potion of Water Breathing"))
(halt)
)

(defrule r121
(declare (salience 50))
(item (name f119) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f143) (conf (* 0.18 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f143: Golden Carrot, Awkward Potion -> Potion of Night Vision"))
(halt)
)

(defrule r122
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f143) (conf ?c1))
=>
(assert (item (name f144) (conf (* 0.90 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f144: Fermented Spider Eye, Potion of Night Vision -> Potion of Invisibility"))
(halt)
)

(defrule r123
(declare (salience 50))
(item (name f121) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f145) (conf (* 0.11 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f145: Turtle Shell, Awkward Potion -> Potion of Turtle Master"))
(halt)
)

(defrule r124
(declare (salience 50))
(item (name f122) (conf ?c0))
(item (name f129) (conf ?c1))
=>
(assert (item (name f146) (conf (* 0.27 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f146: Phantom Membrane, Awkward Potion -> Potion of Slow Falling"))
(halt)
)

(defrule r125
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f128) (conf ?c1))
=>
(assert (item (name f147) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f147: Fermented Spider Eye, Water Bottle -> Potion of Weakness"))
(halt)
)

(defrule r126
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f133) (conf ?c1))
=>
(assert (item (name f148) (conf (* 0.67 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f148: Glowstone Dust, Potion of Swiftness -> Potion of Swiftness II"))
(halt)
)

(defrule r127
(declare (salience 50))
(item (name f133) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f149) (conf (* 0.52 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f149: Redstone, Potion of Swiftness -> Potion of Swiftness +"))
(halt)
)

(defrule r128
(declare (salience 50))
(item (name f134) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f150) (conf (* 0.47 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f150: Redstone, Potion of Slowness -> Potion of Slowness +"))
(halt)
)

(defrule r129
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f149) (conf ?c1))
=>
(assert (item (name f150) (conf (* 0.32 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f150: Fermented Spider Eye, Potion of Swiftness + -> Potion of Slowness +"))
(halt)
)

(defrule r130
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f134) (conf ?c1))
=>
(assert (item (name f151) (conf (* 0.36 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f151: Glowstone Dust, Potion of Slowness -> Potion of Slowness II"))
(halt)
)

(defrule r131
(declare (salience 50))
(item (name f135) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f152) (conf (* 0.33 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f152: Redstone, Potion of Leaping -> Potion of Leaping +"))
(halt)
)

(defrule r132
(declare (salience 50))
(item (name f135) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f153) (conf (* 0.25 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f153: Redstone, Potion of Leaping -> Potion of Leaping II"))
(halt)
)

(defrule r133
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f152) (conf ?c1))
=>
(assert (item (name f150) (conf (* 0.38 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f150: Fermented Spider Eye, Potion of Leaping + -> Potion of Slowness +"))
(halt)
)

(defrule r134
(declare (salience 50))
(item (name f136) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f154) (conf (* 0.79 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f154: Redstone, Potion of Strength -> Potion of Strength +"))
(halt)
)

(defrule r135
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f136) (conf ?c1))
=>
(assert (item (name f155) (conf (* 0.68 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f155: Glowstone Dust, Potion of Strength -> Potion of Strength II"))
(halt)
)

(defrule r136
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f137) (conf ?c1))
=>
(assert (item (name f156) (conf (* 0.93 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f156: Glowstone Dust, Potion of Healing -> Potion of Healing II"))
(halt)
)

(defrule r137
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f138) (conf ?c1))
=>
(assert (item (name f157) (conf (* 0.85 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f157: Glowstone Dust, Potion of Harming -> Potion of Harming II"))
(halt)
)

(defrule r138
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f156) (conf ?c1))
=>
(assert (item (name f157) (conf (* 0.24 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f157: Fermented Spider Eye, Potion of Healing II -> Potion of Harming II"))
(halt)
)

(defrule r139
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f139) (conf ?c1))
=>
(assert (item (name f158) (conf (* 0.47 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f158: Glowstone Dust, Potion of Poison -> Potion of Poison II"))
(halt)
)

(defrule r140
(declare (salience 50))
(item (name f139) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f159) (conf (* 0.33 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f159: Redstone, Potion of Poison -> Potion of Poison +"))
(halt)
)

(defrule r141
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f158) (conf ?c1))
=>
(assert (item (name f157) (conf (* 0.60 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f157: Fermented Spider Eye, Potion of Poison II -> Potion of Harming II"))
(halt)
)

(defrule r142
(declare (salience 50))
(item (name f140) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f160) (conf (* 0.72 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f160: Redstone, Potion of Regeneration -> Potion of Regeneration +"))
(halt)
)

(defrule r143
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f140) (conf ?c1))
=>
(assert (item (name f161) (conf (* 0.65 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f161: Glowstone Dust, Potion of Regeneration -> Potion of Regeneration II"))
(halt)
)

(defrule r144
(declare (salience 50))
(item (name f141) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f162) (conf (* 0.41 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f162: Redstone, Potion of Fire Resistance -> Potion of Fire Resistance +"))
(halt)
)

(defrule r145
(declare (salience 50))
(item (name f142) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f163) (conf (* 0.22 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f163: Redstone, Potion of Water Breathing -> Potion of Water Breathing +"))
(halt)
)

(defrule r146
(declare (salience 50))
(item (name f143) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f164) (conf (* 0.20 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f164: Redstone, Potion of Night Vision -> Potion of Night Vision +"))
(halt)
)

(defrule r147
(declare (salience 50))
(item (name f144) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f165) (conf (* 0.86 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f165: Redstone, Potion of Invisibility -> Potion of Invisibility +"))
(halt)
)

(defrule r148
(declare (salience 50))
(item (name f124) (conf ?c0))
(item (name f164) (conf ?c1))
=>
(assert (item (name f165) (conf (* 0.79 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f165: Fermented Spider Eye, Potion of Night Vision + -> Potion of Invisibility +"))
(halt)
)

(defrule r149
(declare (salience 50))
(item (name f145) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f166) (conf (* 0.05 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f166: Redstone, Potion of Turtle Master -> Potion of Turtle Master +"))
(halt)
)

(defrule r150
(declare (salience 50))
(item (name f108) (conf ?c0))
(item (name f145) (conf ?c1))
=>
(assert (item (name f167) (conf (* 0.12 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f167: Glowstone Dust, Potion of Turtle Master -> Potion of Turtle Master II"))
(halt)
)

(defrule r151
(declare (salience 50))
(item (name f146) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f168) (conf (* 0.24 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f168: Redstone, Potion of Slow Falling -> Potion of Slow Falling +"))
(halt)
)

(defrule r152
(declare (salience 50))
(item (name f147) (conf ?c0))
(item (name f20) (conf ?c1))
=>
(assert (item (name f169) (conf (* 0.50 (min ?c0 ?c1)) ) ) )
(assert (sendmessagehalt "f169: Redstone, Potion of Weakness -> Potion of Weakness +"))
(halt)
)


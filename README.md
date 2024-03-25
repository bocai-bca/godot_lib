# 介绍  
这个仓库包含了一些封装好功能的场景以供你直接导入进Godot项目中使用，如果是直接粘贴使用而非拆解学习，请留意日后可能为适配Godot新版本或修复漏洞而更新，记得跟随。  

# 索引  
## 类  
### [GD链表](bca_godot_lib/GDScript/Classes/linked_list)
名称: `linked_list`  
类型名称: `LinkedListGD`  
语言: `GDScript`  
引擎版本: `v4.2.1.stable.official [b09f793f5]`
最后更新时间: 2024年3月25日
> 使用GDScript编写的动态类型链表，每个链表节点具有值与子节点两个属性，可以与`DoublyLinkedListGD`混用。值可以为任何类型，子节点必须是`LinkedListGD`或`DoublyLinkedListGD`。
### [GD双向链表](bca_godot_lib/GDScript/Classes/linked_list)
名称: `doubly_linked_list`  
类型名称: `DoublyLinkedListGD`  
语言: `GDScript`  
引擎版本: `v4.2.1.stable.official [b09f793f5]`
最后更新时间: 2024年3月25日
> 使用GDScript编写的动态类型链表，每个链表节点具有值、子节点与父节点三个属性，可以与`LinkedListGD`混用。值可以为任何类型，子节点与父节点必须是`LinkedListGD`或`DoublyLinkedListGD`。
## 2D  
### [有过渡补间的圆形判定箱](bca_godot_lib/GDScript/2D/Area2D/generic_circle_hitbox)  
名称: `generic_circle_hitbox`  
语言: `GDScript`  
引擎版本: `v4.2.1.stable.official [b09f793f5]`  
最后更新时间: 2024年3月6日  
根节点类型: `Area2D`  
已用节点类型: `Area2D`、`CollisionShape2D`
> 在普通的圆形Area2D判定区域基础上增加了两个额外的判定形状，分别是一个圆形(`CircleShape2D`)和一个线条(`SegmentShape2D`)，用来表示圆形区域在上一帧的位置(不支持偏斜(skew))，和两个圆形之间的过渡区域。此种判定箱用简单粗暴的方式解决了当物体移动速度过快而跃过了本应触碰的判定区域的问题。  
### [有过渡补间的矩形判定箱](bca_godot_lib/GDScript/2D/Area2D/generic_rectangle_hitbox)  
名称: `generic_rectangle_hitbox`  
语言: `GDScript`  
引擎版本: `v4.2.1.stable.official [b09f793f5]`  
最后更新时间: 2024年3月17日  
根节点类型: `Area2D`  
已用节点类型: `Area2D`、`CollisionShape2D`、`CollisionPolygon2D`
> 在普通的矩形Area2D判定区域基础上增加了两个额外的判定形状，分别是一个矩形(`RectangleShape2D`)和一个四边形，用来表示矩形区域在上一帧的位置和旋转姿态(不支持偏斜(skew))，和两个矩形之间的过渡区域。此种判定箱用简单粗暴的方式解决了当物体移动速度过快而跃过了本应触碰的判定区域的问题。  
> 但该矩形判定箱主要是考虑为矩形在前后两帧之间的位移形成补间，而非旋转。虽然它也能胜任大部分旋转情况，但当位移距离相对于矩形尺寸来说过小以至于两个矩形相互穿透时，对旋转区域的补间多边形因仍然只有四个边而不能覆盖到应该覆盖的区域。  

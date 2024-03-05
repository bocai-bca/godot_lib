# 介绍  
这个仓库包含了一些封装好功能的场景以供直接导入进你的项目中使用。  

# 索引  
## 2D  
### [有过渡补间的圆形判定箱](https://github.com/bocai-bca/godot_lib/tree/main/bca_godot_lib/GDScript/2D/Area2D/generic_circle_hitbox)  
名称: `generic_circle_hitbox`  
根节点类型: `Area2D`  
已用节点类型: `Area2D`、`CollisionShape2D`
> 在普通的圆形Area2D判定区域基础上增加了两个额外的判定形状，分别是一个圆形(`CircleShape2D`)和一个线条(`SegmentShape2D`)，用来表示圆形区域在上一帧的位置，和两个圆形之间的过渡区域。此种判定箱用简单粗暴的方式解决了当物体移动速度过快而跃过了本应触碰的判定区域的问题。  

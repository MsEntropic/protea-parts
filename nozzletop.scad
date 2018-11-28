
bottomdia=11.2;
bottomheight=10.8;
height=20.5;
effectorheight=8;
topdia=9.0;
wall=3;
pipedia=7;
mount_radius=12.5; // standard hole mounting = 25mm therefore 12.5

module nozzleholder() {
    difference(){
            union(){
    //base for effector nuts
            for (a=[-45,145]) rotate ([0,0,a])
                for (b=[0:mount_radius]) translate([b,0,0]) cylinder(r=wall+1,h=wall, $fn=60);
    //main body
            cylinder(r=(bottomdia/2)+wall, h=height+wall, $fn=60);
    //reinforcement
            translate ([2,1, 0]) cylinder(r=(bottomdia/2)+wall, h=height+wall, $fn=60);
                    }
    //hollow for holder
            translate ([0,0,-1])
                cylinder(r=(bottomdia/2+0.5), h=bottomheight+1, $fn=60);#
            translate ([0,0,bottomheight])
                cylinder(r=(topdia/2)+0.5, h=height-bottomheight, $fn=60);#
            //hole for mount screws
                    for (a=[-45,145]) rotate ([0,0,a])
                    translate([mount_radius,0,0]) cylinder(r=1.55, h=3*wall, $fn=60);
    //hole for pipe and holder
            rotate([0,0,40])cylinder(r=(pipedia/2),h=height+5, $fn=6);
    //cutaway - bottom
    //        translate([-40,-20,wall]) rotate([0,0,37])cube([30,35,bottomheight-wall]);
    //        translate([7,-22,wall]) rotate([0,0,37])cube([30,20,bottomheight-wall]);
    //cutaway - mid
    //        translate([-10,-5,bottomheight+wall]) rotate([0,0,37])cube([30,30,height-bottomheight-wall]);
    //        translate([7,-22,bottomheight+wall]) rotate([0,0,37])cube([30,20,height-bottomheight-wall]);
    //cutaway cheeseslice
            translate([1,1,-5]) linear_extrude(height = height+15) polygon(points=[[0,0],[-bottomdia*2,0],[0,-bottomdia*2]]);
            }
            }
            
//this module for use when some of the needleholder physically penetrates the effector. Adds variable effectorheight for region contained within effector, surprisingly enough     
module cutoffnozzleholder() {
    difference(){
            union(){
    //base for effector nuts
            for (a=[0,180]) rotate ([0,0,a])
                for (b=[0:mount_radius]) translate([b,0,0]) cylinder(r=wall,h=wall, $fn=60);
    //main body
            cylinder(r=(bottomdia/2)+wall, h=height+wall-effectorheight, $fn=60);
    //reinforcement
            translate ([0,2, 0]) cylinder(r=(bottomdia/2)+wall, h=height+wall-effectorheight);
                    }
            //hollow for holder
            translate ([0,0,(bottomheight-effectorheight)])
                cylinder(r=(topdia/2)+0.5, h=height-bottomheight, $fn=60);#
            translate ([0,0,-effectorheight])
                cylinder(r=(bottomdia/2+0.5), h=bottomheight+1, $fn=60);
            //hole for mount screws
                    for (a=[0,180]) rotate ([0,0,a])
                    translate([mount_radius,0,0]) cylinder(r=1.55, h=3*wall, $fn=60);
            //hole for pipe and holder
            rotate([0,0,40])cylinder(r=(pipedia/2),h=height+5, $fn=6);
            translate([1,1,-5]) linear_extrude(height = height+15) polygon(points=[[0,0],[-bottomdia*2,-bottomdia*2],[bottomdia*2,-bottomdia*2]]);
            }
            }
cutoffnozzleholder();
include <configuration.scad>;

separation = 40;  // Distance between ball joint mounting faces.
offset = 20;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 12.5;  // Hotend mounting screws, standard would be 25mm (therefore 12.5).
nozzle_radius = 11.3/2;  // Hole for the hotend (J-Head diameter is 16mm).
push_fit_height = 5;  // Length of brass threaded into printed plastic. (def 4)
height = 8; //(def 8)
cone_r1 = 2.5;
cone_r2 = 14;

module effector() {
  difference() {
    union() {
      cylinder(r=offset-3, h=height, center=true, $fn=60);
      for (a = [60:120:359]) rotate([0, 0, a]) {
	rotate([0, 0, 30]) translate([offset-2, 0, 0])
	  cube([10, 13, height], center=true);
	for (s = [-1, 1]) scale([s, 1, 1]) {
	  translate([0, offset, 0]) difference() {
	    intersection() {
	      cube([separation, 40, height], center=true);
	      translate([0, -4, 0]) rotate([0, 90, 0])
		cylinder(r=10, h=separation, center=true);
	      translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
		cylinder(r1=cone_r2, r2=cone_r1, h=14, center=true, $fn=24);
	    }
	    rotate([0, 90, 0])
	      cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
	    rotate([90, 0, 90])
	      cylinder(r=m3_nut_radius, h=separation-24, center=true, $fn=6);
        
	  }
        }
      }
    }
    translate([0,0,-height])
      cylinder(r=nozzle_radius, h=height+5, $fn=36); 
    translate([0, 0, 0])
      cylinder(r=offset-5, h=height, $fn=36);
    translate([0, 0, -6]) # import("m5_internal.stl");
    for (a = [0:60:359]) rotate([0, 0, a]) {
      translate([0, mount_radius, 0])
	cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
    }
  }
}

module modeffector (boltdia,boltdepth){
   //add screw holes for alternative connector
    union() {
        effector();
        //reflect for a bolt on each side
        for (s = [-1, 1]) scale([1, s, 1]){
            //reflect to make pairs for bolts
        translate([0,nozzle_radius+1,boltdia-0.6])
        for (s = [-1, 1]) scale([s, 1, 1]){
            difference(){
                translate([boltdepth/2, 0,0]) rotate([0, 90, 0])
                union(){ cylinder(r=(boltdia/2)+1, h=2, center=true, $fn=24);
                    translate([boltdepth/4, 0,0])
                    cube([4,boltdia+2,2], center=true);};
                translate([boltdepth/2, 0,0]) rotate([0, 90, 0]) 
                cylinder(r=boltdia/2, h=3, center=true, $fn=24);}
                ;}
                ;}
                ;}
            }
difference(){
        union(){
            //rim to support heatsink
            translate([0, 0, -height/2])  
            cylinder(r=nozzle_radius+3, h=height, $fn=36);
            effector();
            };
            //branding
            rotate([0,180,0]) translate([-separation/4,(separation/2)-3,(height/2)-0.3])linear_extrude(3) text("PROTEA", size=4, font="Liberation Mono:style=Bold", spacing=1.0, convexity=6);
            //hole to allow needle access
              translate([0,0,-height])
      cylinder(r=nozzle_radius+0.2, h=height+5, $fn=36);}
        
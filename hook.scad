quality=0;//=1

$fs=(quality==1)?0.01:0.1;
$fa=(quality==1)?5:30;

module cabin_wall()
{
thickness=2.0;
translate([-2,-thickness,-1]) cube([26,thickness,10]);
}

module link_hole()
{
  translate([22/2-3/2-0.1,-2.6,3.5]) cube([3.2,10.0,1.2]);
}

module bar()
{
rotate([0,90,0])
  translate([-2.0,2.5,2])
    cylinder(r=1.5,h=18);
}

//base
difference()
{
  //cube([22,6,9]);//base limits
  union()
  {//shaped base
    cube([22,2.5,9]);
    translate([0,2.5,2.0])
      rotate([0,90,0])
        cylinder(r=2.0,h=23);
    translate([0,2.0,2]) cube([22,2.5,4]);
  }//shaped base
  translate([2,0,0]) cube([18,6,3.5]);
  //link
  link_hole();
}//base

//hook
radius=2.5;//radius hook
size=3.0-0.4;//hook opening
difference()
{
  //hook
  union()
  {//shaped base
    translate([22/2-5/2,2.5,2.0])
      rotate([0,90,0])
        cylinder(r=radius,h=5);
    translate([22/2-5/2-0.1,-2.6,-1]) cube([5.2,5.0,7]);//filling hook to base
  }
  //opening
//translate([22/2-5/2-0.1,-2.6,-2.6]) cube([5.2,5.0,5]);//front
translate([22/2-5/2-0.1,2.5-size/2.0,-2.7]) cube([5.2,size,5]);//middle
//translate([22/2-5/2-0.1,2.6,-2.6]) cube([5.2,5.0,5]);//rear
  //drilling
  bar();
  //link
  link_hole();
  //hook rear
  translate([22/2-3/2-0.1,3.5,-1.5]) cube([3.2,5.0,5.0]);
}

//support
tmp=0.7;
z=-1;
//hook support
h=0.9;
for (y= [3.5 : 2.5 : 3.5] )
  for (x= [8.7 : 2 : 14] )
    translate([x,y,z]) cube([tmp,tmp,h]);
//base support
hh=1;
for (y= [2 : 2.5 : 3.5] )
  for (x= [0, 1.5,  20, 21.5] )
    translate([x,y,z]) cube([tmp,tmp,hh]);

difference()
{
  cabin_wall();
  //link
  link_hole();
}//base
//bar();

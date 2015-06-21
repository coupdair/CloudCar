module cabin_wall()
{
thickness=2.0;
translate([-2,-thickness,-1]) cube([26,thickness,10]);
}

module bar()
{
rotate([0,90,0])
  translate([-2.0,2.5,2])
    cylinder(r=1.5,h=18);
}

difference()
{
  //base
  //cube([22,6,9]);//base limits
  union()
  {//shaped base
  cube([22,2.5,9]);
  translate([0,2.5,2.0])
    rotate([0,90,0])
      cylinder(r=2.0,h=23);
  }//base
  translate([2,0,0]) cube([18,6,3.5]);
}

radius=2.5;//hook
size=3.0-0.4;//hook opening
difference()
{
translate([22/2-5/2,2.5,2.0])
  rotate([0,90,0])
    cylinder(r=radius,h=5);

//translate([22/2-5/2-0.1,-2.6,-2.6]) cube([5.2,5.0,5]);//front
translate([22/2-5/2-0.1,2.5-size/2.0,-2.6]) cube([5.2,size,5]);//middle
//translate([22/2-5/2-0.1,2.6,-2.6]) cube([5.2,5.0,5]);//rear
bar();
}

cabin_wall();
//bar();

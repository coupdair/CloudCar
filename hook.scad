difference()
{
  cube([22,6,9]);
  translate([2,0,0]) cube([18,6,3.5]);
}

translate([22/2-5/2,0,0]) cube([5,5.0,9]);

rotate([0,90,0])
  translate([-2.0,2.5,2])
    cylinder(r=1.5,h=18);

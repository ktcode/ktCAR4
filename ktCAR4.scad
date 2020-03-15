//
// ktCAR4
//
//


gap1 = 0.001;
gap2 = 0.002;

panel_thick = 2;






translate([0, 0, 0]) MAIN();
//R_base();

module MAIN()
{
    difference()
    {
        union()
        {
            cube([155+1, 3, 95]);
            translate([0, 0, 0]) L();
            translate([0, 0, 95-panel_thick]) R();
            translate([0, 0, 95-panel_thick]) R_base();
            translate([155, 2.8, 0]) rotate([0, -90, 17]) F();
        }
        translate([155+10.4, 2.8, -10]) rotate([0, -90, 17]) cube([120, 120, 10]);
        translate([(155-80)/2, -10, (95-55)/2]) cube([80, 20, 55]);
    }
}

module L()
{
    linear_extrude(height=10) 
    polygon(points=[[0,0],[0,12.5],[10,15],[20,18],[30,21],[40,23.7],[50,26.5],[60,30],[70,33.5],[80,37],[90,41.5],[100,46.5],[110,52],[120,58],[130,64],[134,66],[140,46],[154,0]]);
}

module R()
{
    linear_extrude(height=panel_thick) 
    polygon(points=[[0,0],[0,17.5],[10,20],[20,23],[30,26.5],[40,30],[50,34],[60,38],[70,42],[80,37],[90,31.5],[100,26.5],[110,21.5],[120,17.5],[130,13.5],[140,10],[154,6],[154,0]]);
}

module F()
{
    linear_extrude(height=panel_thick) 
    polygon(points=[[0,0],[0,66.5],[10,67],[20,67.5],[30,68],[40,68.5],[45,63],[48,63],[50,63],[60,63],[62,63],[65,63],[70,50],[75,38.5],[78,32.25],[80,28],[82,24],[85,18],[88,13],[90,10],[95,4],[95,0]]);
}

module R_base()
{
    difference()
    {
        translate([0, 0, -10+gap1*12]) cube([60, 40, 10]);

        translate([-gap1, gap1, 2]) difference()
        {
            translate([-0, -0, -panel_thick*6+gap1*8])cube([130, 100, panel_thick*6]);
            translate([-gap1, -gap1, gap1]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*1-gap1*1)]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*2-gap1*2)]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*3-gap1*3)]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*4-gap1*4)]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*5-gap1*5)]) R();
            translate([-gap1, -gap1, gap1-(panel_thick*6-gap1*6)]) R();
        }
        translate([0, 0, -150-10]) cube([150, 150, 150]);
        translate([0, 0, 0]) cube([150, 150, 150]);
    }
}

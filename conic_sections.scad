
module cone(x, y, z, rotx, roty,rotz)
{
    translate([x, y, z])
    {
        rotate([rotx,roty,rotz])
        cylinder( r1=15, r2=0, h=50, center = true);
    }
}

module square_m(x, y, z, rotx, roty, rotz, l, w)
{
    translate([x, y, z])
    {
        rotate([rotx, roty, rotz])
        //linear extrude just added for the requirements...
        linear_extrude(2)
        square([l, w], center=true);
    }
}

//bottom cone
module bottom_cone() cone(0, 0, 25, 0, 0, 0);


//top cone
module top_cone() cone(0, 0, 70, 180, 0, 0);


//large square that makes two hyperbolas
module hyperbola() square_m(0, -10, 50, 90, 0, 0, 30, 100);

//square that makes ellipse with bottom cone
module ellipse()
square_m(0, 0, 30, 135, 0, 0, 30, 30);


//makes circle with top cone
module circle_m()
square_m(0, 0, 75, 0, 0, 0, 30, 30);

//makes a parabola with top cone
module parabola()
square_m(0, -3, 90, -115, 0, 0, 30, 30);


top_cone();
bottom_cone();
hyperbola();
parabola();
ellipse();
circle_m();

//scale the parabola along the x,y plane
//TODO: fix so that it follows the plan

/*
scale([2, 2, 1])
{
    intersection()
    {
        top_cone();
        parabola();
    }
}

//scale the circle
scale([1.7, 1.7, 1])
{
    intersection()
    {
        top_cone();
        circle_m();
    }
}

//scale the hyperbola

scale([2, 1, 1])
{
union()
{
    intersection()
    {
        top_cone();
        hyperbola();
    }

    intersection()
    {
        bottom_cone();
        hyperbola();
    }
}
}
intersection()
{
    ellipse();
    bottom_cone();
}
*/






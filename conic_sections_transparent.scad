module cone(x, y, z, rotx, roty,rotz)
{
    translate([x, y, z])
    {
        rotate([rotx,roty,rotz])
        cylinder(r1=15, r2=0, h=50, center = true);
    }
}

module cube_m(x, y, z, rotx, roty, rotz, l, w, t)
{
    translate([x, y, z])
    {
        rotate([rotx, roty, rotz])
    cube([l, w, 0.3], center=true);
    }
}

module write(x, y, z, rotx, roty, rotz, stuff, s)
{
    translate([x, y, z])
    {
        rotate([rotx, roty, rotz])
        text(stuff, size=s);
    }
}

//make edges relatively smooth
$fn = 80;

//TODO: make projection of base and triangle the same thickness
union()
{
    linear_extrude(0.2)
    {
        projection(cut = false)
        {
            cone(0, 0, 25, 0, 0, 0);
        }
    }
    scale([1, 0.1, 1])
    {
        cone(0, 0, 25, 0, 0, 0);
    }
}


/*
write(-7, 12, 1.5, 90, 0, 0, "(x^2/a^2) - (y^2/b^2) = 1", 1);
*/

//make the hyperbola
//adjust z in cube_m to make myperbola larger
intersection()
{
    cone(0, 0, 25, 0, 0, 0);
    cube_m(0, 12, 12, -90, 0, 0, 30, 30, 10);
    
}

//make the parabola
intersection()
{
    cone(0, 0, 25, 0, 0, 0);
    cube_m(0, 0, 4, 45, 0, 0, 30, 30);
}

//make the ellipse
intersection()
{
    cone(0, 0, 25, 0, 0, 0);
    cube_m(0, 0, 15, 35, 0, 0, 40, 40);
}

//make the circle
intersection()
{
    cone(0, 0, 25, 0, 0, 0);
    cube_m(0, 0, 25, 0, 0, 0, 30, 30);
}


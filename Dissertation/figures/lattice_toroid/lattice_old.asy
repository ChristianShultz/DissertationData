settings.outformat="pdf";
import surfacepaths;

unitsize(1.5cm);
triple eye = 4*(0,1,3.5);
currentprojection=perspective(eye, up=Y);

surface torus = surface(O, shift(2X)*path3(scale(0.4)*unitcircle), axis=Y);
SmoothSurface Torus = SmoothSurface(torus);

Torus.drawSilhouette();
real diff = .07;
real midpoint = .75;
path circle1 = project(Torus.drawSurfacePath((midpoint-diff, 0) -- (midpoint-diff, 1)), ninterpolate=1);
path circle2 = project(Torus.drawSurfacePath((midpoint+diff,0) -- (midpoint+diff,1)),ninterpolate=1);

drawLayeredPaths();    // Draw the paths (with hidden path removal) that were computed in the previous code block.

real circle1mintime = mintimes(circle1)[1];    // the time at which circle1 reaches its minimum vertical extent
pair p1 = point(circle1, circle1mintime);
label("$\mathcal C$", position=p1, align=SW);

real circle2mintime = mintimes(circle2)[1];
pair p2 = point(circle2, circle2mintime);
label("$\mathcal C'$", position=p2, align=SE);

diff += .01;
path3 arc = Torus.onSurface((midpoint-diff,.75) -- (midpoint+diff,.75));
draw(shift(0,-1)*project(arc), arrow=ArcArrow());

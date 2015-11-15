settings.outformat="pdf";
import surfacepaths;

real unit = 1.5cm;
unitsize(unit);
triple eye = 4*(0,1,3.5);
currentprojection=perspective(eye,up=Y);

// a surface 
surface torus = surface(O, shift(2X)*path3(scale(0.4)*unitcircle), axis=Y);
SmoothSurface Torus = SmoothSurface(torus);

path makeline(pair a, pair b, int ucycles=0, int vcycles=0) {
    b = b + (ucycles, vcycles);
    int n = 6;   // number of segments
    guide toreturn = a;
    for (int i = 0; i <= n; ++i) {
        toreturn = toreturn -- interp(a, b, i/n);
    }
    return toreturn;
}

pen linewidth = linewidth(1pt);

int nuw = 39; 
int nvw = 19; 
Torus.drawMesh(nu=nuw, nv=nvw, npath=5);
Torus.drawSilhouette(p=black, includePathsBehind=true);


pair s1 = (-12/nuw,0);
pair s2 = (2/nuw,2/nvw) + s1; 
pair s3 = (1/nuw,0) + s2; 
pair s3p = (9/(10*nuw),0) + s2; 
path3 U = Torus.onSurface(makeline(s2, s3p ));


drawLayeredPaths();

draw( project(U), arrow=ArcArrow, p=blue);

dot(project(Torus.point(s1)), p=red, L="$\psi$", align=NE);
dot(project(Torus.point(s3)), p=blue, L="$U$", align=NE);
dot(project(Torus.point(s2)), p=blue);

real midpoint = .75;
real diff = .08;
path3 arc = Torus.onSurface((midpoint-diff,.75) -- (midpoint+diff,.75));
draw(shift(0,-1.2)*project(arc), arrow=ArcArrow());

path3 arc2 = Torus.onSurface((midpoint-diff,.75) -- (midpoint-diff,1.2));
draw(shift(0,-1.2)*project(arc2), arrow=ArcArrow());



 shipout(bbox(xmargin=10pt, p=invisible));

settings.outformat="pdf";
settings.render=0;
import surfacepaths;

real unit = 2cm;
unitsize(unit);
triple eye = (10,0,6.9);
//currentprojection=perspective(2*eye);
currentprojection=orthographic(eye);
//currentprojection=perspective(eye,up=Y);

surface torus = surface(Circle(c=2Y, r=0.6, normal=X, n=32), c=O, axis=Z, n=32);
torus.ucyclic(true);
torus.vcyclic(true);

SmoothSurface Torus = SmoothSurface(torus);

Torus.drawSilhouette(p=black, includePathsBehind=true);

/* Make parampath an alias for triple(real). */
typedef triple parampath(real);

path makeline(pair a, pair b, int ucycles=0, int vcycles=0) {
    b = b + (ucycles, vcycles);
    int n = 6;   // number of segments
    guide toreturn = a;
    for (int i = 0; i <= n; ++i) {
        toreturn = toreturn -- interp(a, b, i/n);
    }
    return toreturn;
}

pair s1 = (0,0);
pair s2 = (0, 1/4);
pair s3 = (0, 1/2);

pen linewidth = linewidth(1pt);

Torus.drawSurfacePath(makeline(s1, s1, vcycles=1), p=linewidth);
//Torus.drawSurfacePath(makeline(s2, s2, ucycles=1), p=linewidth + red);

// Torus.drawMesh(nu=39, nv=20, npath=5);

drawLayeredPaths();

//dot(project(Torus.point(s1)), p=orange, L="$s_1$", align=E);
//dot(project(Torus.point(s2)), p=red, L="$s_2$", align=NE);
//dot(project(Torus.point(s3)), p=green, L="$s_3$", align=W);

shipout(bbox(xmargin=10pt, p=invisible));

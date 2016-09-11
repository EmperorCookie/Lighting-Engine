///line_cross_rectangle(line_x1,line_y1,line_x2,line_y2,rect_x1,rect_y1,rect_x2,rect_y2)
var lx1, ly1, lx2, ly2, rx1, ry1, rx2, ry2, a, t;
// make sure it goes from low to high
lx1 = min(argument0, argument2);
ly1 = min(argument1, argument3);
lx2 = max(argument0, argument2);
ly2 = max(argument1, argument3);
rx1 = min(argument4, argument6);
ry1 = min(argument5, argument7);
rx2 = max(argument4, argument6);
ry2 = max(argument5, argument7);
// checks if the vertical projection overlaps
if(lx1 < rx1 && lx2 < rx1) {
    return 0;
}
if(lx1 > rx2 && lx2 > rx2) {
    return 0;
}
// collision check for a vertical line or point
if(lx1 == lx2) {
    return !((ly1 < ry1 && ly2 < ry1) || (ly1 > ry2 && ly2 > ry2));
}
// collision check for other lines
a = (ly1 - ly2) / (lx1 - lx2);
t = a * (max(lx1, rx1) - lx1) + ly1;
if(t > ry1 && t < ry2) {
    return 1;
}
t = a * (min(lx2, rx2) - lx1) + ly1;
if(t > ry1 && t < ry2) {
    return 1;
}
return 0;

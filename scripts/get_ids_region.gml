///get_ids_region(obj, x1, y1, x2, y2)
var arr, n;
n = 0;
arr[0] = noone;
with (argument0) {
   if (point_in_rectangle(x, y, argument1, argument2, argument3, argument4)) {
      arr[n++] = id;
   }
}
return arr;

///get_ids_region_by_bbox(obj, x1, y1, x2, y2)
var arr, n;
n = 0;
arr[0] = noone;
with (argument[0]) {
   if (point_in_rectangle(x, y,
      argument[1] + (bbox_left - x),
      argument[2] + (bbox_top - y),
      argument[3] + (bbox_right - x),
      argument[4] + (bbox_bottom - y)
   )) {
      arr[n++] = id;
   }
}
return arr;

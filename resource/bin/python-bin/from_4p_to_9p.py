import json
import sys
import coco
from itertools import chain
from pathlib import Path
input_file_name = Path(sys.argv[1])
output_file_name = input_file_name.with_suffix('.9p.json')
data = coco.COCO(input_file_name)
assert data.cats[0]['keypoints'] == ['left_front_wheel', 'right_front_wheel', 'right_rear_wheel', 'left_rear_wheel']
data.cats = [{
        'id': 1,
        'name': '车',
        'supercategory': 'car', 
        'skeleton': [
            [1, 2], [2, 3], [3, 4], [4, 1], 
            [1, 5], [2, 5], [1, 6], [4, 6], 
            [2, 7], [3, 7], [3, 8], [4, 8], 
            [1, 9], [2, 9], [3, 9], [4, 9]],
        'keypoints': [
            'left_front_wheel', 
            'right_front_wheel', 
            'right_rear_wheel', 
            'left_rear_wheel',
            'front',
            'left',
            'right',
            'rear',
            'center',
        ]
    }
]

def center_point(pt1, pt2):
    x = (pt1[0] + pt2[0]) // 2
    y = (pt1[1] + pt2[1]) // 2
    c = 1
    if pt1[2] == 0 or pt2[2] == 0:
        c = 0
    if pt1[2] == 2 and pt2[2] == 2:
        c = 2
    return [x, y, c]

for i in data.anns:
    if i['num_keypoints'] != 4:
        i['keypoints'] += [0] * 15
    else:
        left_front = i['keypoints'][:3]
        right_front = i['keypoints'][3:6]
        right_rear = i['keypoints'][6:9]
        left_rear = i['keypoints'][9:12]
        front = center_point(left_front, right_front)
        left = center_point(left_front, left_rear)
        right = center_point(right_front, right_rear)
        rear = center_point(left_rear, right_rear)
        center_1 = center_point(left_front, right_rear)
        center_2 = center_point(left_rear, right_front)
        center = center_point(center_1, center_2)
        i['keypoints'] = list(chain(i['keypoints'], front, left, right, rear, center))
        i['num_keypoint'] = 9

data.to_json(output_file_name)
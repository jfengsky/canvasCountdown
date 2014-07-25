/**
 * Description:
 * Author: jiangfeng(jiang.f@ctrip.com)
 * Date: 2014-07-25 15:56
 *
 */

var digit =
  [
    [
      [0,0,1,1,1,0,0],
      [0,1,1,0,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,0,1,1,0],
      [0,0,1,1,1,0,0]
    ],//0
    [
      [0,0,0,1,1,0,0],
      [0,1,1,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [1,1,1,1,1,1,1]
    ],//1
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,0,0,0],
      [0,1,1,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,0,0,0,1,1],
      [1,1,1,1,1,1,1]
    ],//2
    [
      [1,1,1,1,1,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,1,0,0],
      [0,0,0,0,1,1,0],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//3
    [
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,1,0],
      [0,0,1,1,1,1,0],
      [0,1,1,0,1,1,0],
      [1,1,0,0,1,1,0],
      [1,1,1,1,1,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,1,1]
    ],//4
    [
      [1,1,1,1,1,1,1],
      [1,1,0,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,1,1,1,1,0],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//5
    [
      [0,0,0,0,1,1,0],
      [0,0,1,1,0,0,0],
      [0,1,1,0,0,0,0],
      [1,1,0,0,0,0,0],
      [1,1,0,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//6
    [
      [1,1,1,1,1,1,1],
      [1,1,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,0,0,1,1,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0],
      [0,0,1,1,0,0,0]
    ],//7
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,1,1,0]
    ],//8
    [
      [0,1,1,1,1,1,0],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [1,1,0,0,0,1,1],
      [0,1,1,1,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,0,1,1],
      [0,0,0,0,1,1,0],
      [0,0,0,1,1,0,0],
      [0,1,1,0,0,0,0]
    ],//9
    [
      [0,0,0,0],
      [0,0,0,0],
      [0,1,1,0],
      [0,1,1,0],
      [0,0,0,0],
      [0,0,0,0],
      [0,1,1,0],
      [0,1,1,0],
      [0,0,0,0],
      [0,0,0,0]
    ]//:
  ];
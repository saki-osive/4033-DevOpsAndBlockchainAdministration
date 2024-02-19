// calculator.test.js

const { add, subtract, multiply } = require('../src/math');

test('addition', () => {
  expect(add(2, 3)).toBe(5);
});

test('subtraction', () => {
  expect(subtract(5, 3)).toBe(2);
});

test('multiplication', () => {
  expect(multiply(2, 4)).toBe(8);
});

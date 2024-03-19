import unittest

from src.main import Main


class TestCalculator(unittest.TestCase):
    def test_add(self):
        main = Main()
        self.assertEqual(3, main.add(1, 2))


if __name__ == '__main__':
    unittest.main()

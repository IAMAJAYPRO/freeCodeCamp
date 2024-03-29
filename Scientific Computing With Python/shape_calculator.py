from math import sqrt


class Rectangle:

  def __init__(self, width, height):
    self.width = width
    self.height = height

  def get_area(self):
    return self.width * self.height

  def set_width(self, value):
    self.width = value

  def set_height(self, value):
    self.height = value

  def get_perimeter(self):
    return 2 * (self.width + self.height)

  def get_diagonal(self):
    return sqrt(self.width**2 + self.height**2)

  def get_picture(self):
    if max((self.width, self.height)) > 50:
      return "Too big for picture."
    pic = ("*" * self.width + "\n") * self.height
    return pic

  def get_amount_inside(self, shape):
    return (self.width // shape.width) * (self.height // shape.height)

  def __str__(self):
    return f"Rectangle(width={self.width}, height={self.height})"


class Square(Rectangle):

  def __init__(self, side):
    super().__init__(side, side)

  def set_side(self, side):
    self.width = self.height = side

  def __str__(self):
    return f"Square(side={self.width})"

import copy
import random
# Consider using the modules imported above.


class Hat:

    def __init__(self, **balls) -> None:
        self.balls = balls
        self.contents = []
        for ball in self.balls:
            self.contents.extend([ball] * self.balls[ball])

    def draw(self, n_balls):
        drawed = []
        for i in range(n_balls):
            l_contents = len(self.contents)
            if l_contents == 0:
                break
            drawed.append(self.contents.pop(random.randrange(l_contents)))
        return drawed


def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    ct = 0
    for i in range(num_experiments):
        hat_copy = copy.deepcopy(hat)
        drawed = hat_copy.draw(num_balls_drawn)
        for i in expected_balls:
            if expected_balls[i] > drawed.count(i):
                break
        else:
            ct += 1
    return ct / num_experiments

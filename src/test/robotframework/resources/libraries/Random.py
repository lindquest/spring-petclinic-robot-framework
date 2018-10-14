from random import choice

class Random:
    def pick_random_element(self, l, unique=True):
        if unique:
            all_once = set(l)
            l = list(all_once - set(self._non_uniques(l)))
        else:
            l = self._non_uniques(l)
        return choice(l)

    def _non_uniques(self, l):
        non_uniques = []
        for element in l:
            if l.count(element) > 1 and element not in non_uniques:
                non_uniques.append(element)
        return non_uniques
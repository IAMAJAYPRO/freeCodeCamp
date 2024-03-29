import numpy as np


def calculate(li):
    if len(li) != 9:
        raise ValueError("List must contain nine numbers.")
    arr = np.array(li)
    mat = arr.reshape(3, 3)
    mat_t = mat.T
    things = mat, mat_t

    result = {
        'mean': [*(a.mean(axis=0).tolist() for a in things),
                 arr.mean()],
        'variance': [*(a.var(axis=0).tolist() for a in things),
                     arr.var()],
        'standard deviation':
        [*(a.std(axis=0).tolist() for a in things),
         arr.std()],
        'max': [*(a.max(axis=0).tolist() for a in things),
                arr.max()],
        'min': [*(a.min(axis=0).tolist() for a in things),
                arr.min()],
        'sum': [*(a.sum(axis=0).tolist() for a in things),
                arr.sum()]
    }

    return result

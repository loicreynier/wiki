---
title: Numpy
icon: material/data-matrix
---

# NumPy (& SciPy)

## Read and print Matrix Market matrix files

SciPy provides an interface to read Matrix Market format files (`.mtx`),
which can be generated, for example, by AMGX's `AMGX_write_system` function.
However, it is important to note that `AMGX_write_system`,
writes the matrix first, followed by the RHS and initial solution vectors within the same file.
This format is not fully compatible with SciPy's binding which can only read the matrix.
The `.mtx` file need to be edited, leaving only the matrix and keeping the full top banner,
then it can be loaded using:

```python
import sys
from scipy.io import mmread
import numpy as np

mtx = mmread("AMGX_matrix.mtx")    # Read data
mtx.toarray()                      # Convert to dense matrix
np.set_printoptions(linewidth=100, threshold=sys.maxsize)
print(mtx)
```

* ACQ400_HAPI_MATLAB

Matlab integration with HAPI, allows control of ACQ400 from Matlab(R)

0. HAPI loaded from git. Set PYTHONPATH. Used Anaconda (preferred)

1. Open Matlab with current folder as ACQ400_HAPI_MATLAB directory

2. check_pypath
C:/ACQ400_HAPI/acq400_hapi

3. edit name_UUTS.m to suit
```python
global UUTS

%UUTS = {'acq2106_176'}
UUTS = {'acq2106_176','acq2106_054'}
%UUTS = {'acq2106_295','acq2106_293','acq2106_294'}


2. check_pypath
C:/ACQ400_HAPI/acq400_hapi

3. edit name_UUTS.m to suit
```python
global UUTS

%UUTS = {'acq2106_176'}
UUTS = {'acq2106_176','acq2106_054'}
%UUTS = {'acq2106_295','acq2106_293','acq2106_294'}
```


2. check_pypath
C:/ACQ400_HAPI/acq400_hapi

3. edit name_UUTS.m to suit
```python
global UUTS

%UUTS = {'acq2106_176'}
UUTS = {'acq2106_176','acq2106_054'}
%UUTS = {'acq2106_295','acq2106_293','acq2106_294'}
```


2. check_pypath
```
>> check_pypath
C:/ACQ400_HAPI/acq400_hapi
```
C:/ACQ400_HAPI/acq400_hapi

3. edit name_UUTS.m to suit
```python
global UUTS

%UUTS = {'acq2106_176'}
UUTS = {'acq2106_176','acq2106_054'}
%UUTS = {'acq2106_295','acq2106_293','acq2106_294'}
```


2. check_pypath
C:/ACQ400_HAPI/acq400_hapi

3. edit name_UUTS.m to suit and run
```python
global UUTS

%UUTS = {'acq2106_176'}
UUTS = {'acq2106_176','acq2106_054'}
%UUTS = {'acq2106_295','acq2106_293','acq2106_294'}
```

result:
```
>> name_UUTS

UUTS =

  1×2 cell array

    {'acq2106_176'}    {'acq2106_054'}

>> acq400_hello_world
 
K:\Customer\Acquitek\Langevin\MATLAB>call C:\Users\scott\anaconda3\Scripts\activate base  
SUCCESS: acq2106_176 acq2106sfp,AO424ELF N=32 M=41 
SUCCESS: acq2106_054 acq2106,ACQ424ELF,ACQ424ELF,ACQ424ELF,ACQ424ELF,ACQ424ELF,ACQ424ELF 
```

4. 

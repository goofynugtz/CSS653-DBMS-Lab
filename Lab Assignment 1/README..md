Create the following tables.

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Data Type</th>
      <th>Size</th>
      <th>Constraints</th>
    <tr>
  </thead>
  <tbody>
    <tr>
      <td>Eno</td>
      <td>char</td>
      <td>2</td>
      <td>Primary key and first character must be “E”</td>
    </tr>
    <tr>
      <td>Ename</td>
      <td>varchar</td>
      <td>10</td>
      <td>Not null</td>
    </tr>
    <tr>
      <td>City</td>
      <td>varchar</td>
      <td>10</td>
      <td>Cities allowed “Chennai”, “Mumbai”, “Delhi”, “Kolkata”</td>
    </tr>
    <tr>
      <td>Salary</td>
      <td>number</td>
      <td>6</td>
      <td></td>
    </tr>
    <tr>
      <td>Dno</td>
      <td>number</td>
      <td>2</td>
      <td>Foreign key references DEPT table</td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Data Type</th>
      <th>Size</th>
      <th>Constraints</th>
    <tr>
  </thead>
  <tbody>
    <tr>
      <td>Dno</td>
      <td>number</td>
      <td>6</td>
      <td>Primary Key</td>
    </tr>
    <tr>
      <td>DesDname</td>
      <td>varchar</td>
      <td>15</td>
      <td></td>
    </tr>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Data Type</th>
      <th>Size</th>
      <th>Constraints</th>
    <tr>
  </thead>
  <tbody>
    <tr>
      <td>Pno</td>
      <td>char</td>
      <td>2</td>
      <td>Primary Key, First character must be “P”</td>
    </tr>
    <tr>
      <td>Eno</td>
      <td>char</td>
      <td>2</td>
      <td>Primary Key and Foreign Key references EMP</td>
    </tr>
  </tbody>
</table>

Insert at least five data values into the respective tables related with the following queries. 
Perform the following queries.
1. Find the average salary of all employees.
2. List all the employee names whose salary is greater than 7000 and lesser than 18000.
3. Retrieve all information about employees where the Ename is 4 characters long and the 
first two characters are ‘AS’.
4. Display the number of employees in each department.
5. Find the difference between highest and lowest salary.

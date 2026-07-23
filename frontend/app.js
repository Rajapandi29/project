const api = "http://localhost:3000/employees";

document
.getElementById("employeeForm")
.addEventListener("submit", async (e)=>{

e.preventDefault();

const employee={

name:document.getElementById("name").value,

email:document.getElementById("email").value,

department:document.getElementById("department").value

};

await fetch(api,{

method:"POST",

headers:{

"Content-Type":"application/json"

},

body:JSON.stringify(employee)

});

loadEmployees();

e.target.reset();

});

async function loadEmployees(){

const response=await fetch(api);

const employees=await response.json();

const table=document.getElementById("employeeTable");

table.innerHTML="";

employees.forEach(emp=>{

table.innerHTML+=`

<tr>

<td>${emp.name}</td>

<td>${emp.email}</td>

<td>${emp.department}</td>

</tr>

`;

});

}

loadEmployees();
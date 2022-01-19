class Employee {
 final String name, image, category, biography;
 final int patients, reviews;
 final double ratings;



 Employee(this.name, this.image, this.category, this.biography, this.patients,
     this.ratings, this.reviews);

 static List<Employee> employeeList() {
   List<Employee> list = [];
   list.add(Employee(
       'Dr. Anna Baker',
       'assets/images/avatar_4.jpg',
       'Heart Surgeon Specialist',
       'Dr. Anna Baker is an indonesian Heart Surgeon specialist. She practices general at Elizabeth Hospital in Semarang. . .',
       1000,
       4.5,
       120)
   );

   list.add(Employee(
       'Dr. Emilie Jones',
       'assets/images/avatar_4.jpg',
       'Paediatrician',
       'Dr. Emilie Jones is an Indian Paediatrician. She practices general at HealthCare Hospital in New Jersey. . .',
       1200,
       4.0,
       100)
   );

   list.add(Employee(
       'Dr. Joe Taylor',
       'assets/images/avatar_4.jpg',
       'Ophthalmologist',
       'Dr. Joe Taylor is an Japanese Ophthalmologist. He practices general at St. Thomas Hospital in Boston. . .',
       1100,
       3.5,
       150)
   );

   return list;
 }

 static Employee getOne() {
   return Employee(
       'Dr. Anna Baker',
       'assets/images/avatar_4.jpg',
       'Heart Surgeon Specialist',
       'Dr. Anna Baker is an indonesian Heart Surgeon specialist. She practices general at Elizabeth Hospital in Semarang...',
       1000,
       4.5,
       120);
 }
 }
void main() {
  Director director = Director();
  IBuilder carBuilder = Car('jeep');
  director.construct(carBuilder);
  Product car = carBuilder.getVehicle();
  print(car.show());
  }

class  Product {
  List parts = [];
  
  void add(String part){
    parts.add(part);
  }
  
  String show() {
    StringBuffer sb = StringBuffer();
    sb.writeln('Product compenents are:');
    for(String part in parts){
      sb.writeln(part);
    }
    return sb.toString();
  }
}

class Car implements IBuilder {
  String brandName;
  Product product;
  
  Car(String brand){
    this.brandName = brand;
    product = Product();
  }
  
  void startUpOperations(){
    product.add('Car Model Name: ${this.brandName}');
  }
  
  void buildBody() {
    product.add('Bode of car was added');
  }
  
  void insertWheels(){
    product.add('Wheels was added');
  }
  
  void addHeadLights(){
    product.add('HeadLights was added');
  }
  
  Product getVehicle() {
    return product;
  }
}

abstract class IBuilder {
  void startUpOperations();
  void buildBody();
  void insertWheels();
  void addHeadLights();
  Product getVehicle();
}

class Director {
  IBuilder builder;
  
  void construct(IBuilder builder){
    this.builder = builder;
    builder.startUpOperations();
    builder.buildBody();
    builder.insertWheels();
    builder.addHeadLights();
  }
}

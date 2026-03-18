#include <iostream>
#include <string>
using namespace std;

class Animal {
protected:
	string name;

public:
	Animal(string n) {
		name = n;
	}
	void showName() {
		cout << "Name " << name << endl;
	}
	virtual void speak() {
		cout << "Animal makes a soud " << endl;
	}
};
class Dog : public Animal {
private:
	string breed;

public:
	Dog(string n, string b) : Animal(n) {
		breed = b;
	}
	void showBreed() {
		cout << "Breed: " << breed << endl;
	}

		void speak() override {
			cout << "Dog says: Hi!" << endl;
		}
	};

	int main() {
		Animal a("Unknown");
		Dog d("Ted", "Border-collie");

		cout << "Base class object " << endl;
		a.showName(); // базовый
		a.speak(); // свой
		d.speak(); // переопределенный

		cout << "n Test Polymorphism test " << endl;
		Animal* ptr = &d;
		ptr->speak();

		return 0;
	}
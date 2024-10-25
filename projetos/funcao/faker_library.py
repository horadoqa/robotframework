from faker import Faker

class FakerLibrary:
    def __init__(self):
        self.fake = Faker()

    def generate_name(self):
        return self.fake.name()

    def generate_email(self):
        return self.fake.email()

    def generate_phone(self):
        return self.fake.phone_number()

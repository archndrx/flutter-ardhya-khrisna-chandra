import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:soal_app/model/contacts_model.dart';
import 'package:soal_app/viewmodel/provider/contact_provider.dart';

import 'contact_provider_test.mocks.dart';

@GenerateMocks([ContactProvider])
void main() {
  group('ContactProvider', () {
    test('addContact should add new contact to contacts', () {
      final mockContactProvider = MockContactProvider();
      final contact = Contact(
        name: 'John Doe',
        number: 081234567890,
        date: '2022-04-01',
        color: Colors.blue.toString(),
        file: 'path/to/image.jpg',
      );

      when(mockContactProvider.addContacts(contact))
          .thenAnswer((_) async => true);

      expect(mockContactProvider.addContacts(contact), completion(isTrue));
      verify(mockContactProvider.addContacts(contact)).called(1);
      verifyNoMoreInteractions(mockContactProvider);
    });
  });
}

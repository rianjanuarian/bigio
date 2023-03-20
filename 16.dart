import 'dart:io';

void main() {
  int n = 5;
  int spasi = n * 2 - 2;

 
  for (int i = 1; i <= n; i++) {
    
    for (int j = 1; j <= i ; j++) {
      stdout.write(j);
    }

 
    for (int k = 1; k <= spasi; k++) {
      stdout.write(' ');
    }
    spasi -= 2;

 
    for (int l = i; l >= 1; l--) {
      stdout.write(l);
    }

    
    print('');
  }

  spasi = 2;

  for (int i = n - 1; i >= 1; i--) {
  
    for (int j = 1; j <= i; j++) {
      stdout.write(j);
    }

   
    for (int k = 1; k <= spasi; k++) {
      stdout.write(' ');
    }
    spasi += 2;

    
    for (int j = i; j >= 1; j--) {
      stdout.write(j);
    }

    
    print('');
  }
}

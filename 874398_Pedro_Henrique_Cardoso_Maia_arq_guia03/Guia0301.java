class Guia0301 {

    public static void C1(int nbits, int x[]){
        for(int i = 0; i < x.length; i = i + 1) {
            if(x[i] == 0) x[i] = 1;
            if(x[i] == 1) x[i] = 0;
        }
    }

    public static void main(String [] args) {
        //mediante uso de funções C1(nbits, x) e C2(nbits, x)

        String bin = "1001";
        int len = bin.length();
        int binArr[] = new int[len];

        for(int i = 0; i < len; i = i + 1) {
            char tmp = bin.charAt(i);
            binArr[i] = Character.getNumericValue(tmp);

        }

        C1(6, binArr);

        for(int i = 0; i < len; i = i + 1) {
            System.out.printf("%d", binArr[i]);

        }
    }




}
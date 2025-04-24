public class PrintProfile {
    public static void main(String[] args) {
        /* ----- 自己紹介タスク ----- */
        System.out.println("----- 自己紹介タスク -----\n");

        // ここに氏名（ふりがな）を記載してください
        String fullNameKanji = "";
        String fullNameKana = "";
        System.out.println("【氏名（ふりがな）】\n");
        System.out.println(fullNameKanji + "（" + fullNameKana + "）");

        // ここに趣味・好きなもの、最近ハマっていることなどを記載してください
        // - 箇条書きでも、文章でもOKです
        // - 複数ある場合は、String favorite2, String favorite3のように、同じように追加してください
        String favorite1 = "";
        // 複数ある場合は、{} 内に「,」カンマ区切りで追加してください
        // - e.g.）{ favorite1, favorite2 };
        String[] favorites = { favorite1 };
        System.out.println("\n\n【趣味・好きなもの、最近ハマっていることなど】");
        for (int i = 0; i < favorites.length; i++) {
            System.out.println("- " + favorites[i]);
        }

        // 特技（特技ではないけどこういうことできます！もしくは得意になりたいこと等あればそれでも可）
        // - 箇条書きでも、文章でもOKです
        // - 複数ある場合は、String favorite2, String favorite3のように、同じように追加してください
        String strength1 = "";
        // 複数ある場合は、{} 内に「,」カンマ区切りで追加してください
        // - e.g.）{ strength1, strength2 };
        String[] strengths = { strength1 };
        System.out.println("\n\n【特技など】");
        for (int i = 0; i < strengths.length; i++) {
            System.out.println("- " + strengths[i]);
        }

        // 目標や達成したいこと等（もそしあれば）
        // - 複数ある場合は、前述のコードを真似して書いてもらってもよいです
        System.out.println("\n\n【目標や達成したいことなど】");
        String goal = "";
        if (goal != "") {
            System.out.println(goal);
        } else {
            System.out.println("特になし");
        }
    }
}

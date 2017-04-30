package com.hnka;

import com.hnka.bnf.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.*;

import com.hnka.ast.*;
import com.hnka.visitor.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;


/**
 * Created by ceciliahunka on 29/04/17.
 */
public class MiniJavaAST {
    public static void main(String argv[]) throws IOException {

        CharStream stream = CharStreams.fromFileName("public/input.txt");
        TesteLexer lexer = new TesteLexer(stream);
        CommonTokenStream token = new CommonTokenStream(lexer);
        TesteParser parser = new TesteParser(token);

        parser.r();

    }
}

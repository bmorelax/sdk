// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// Generated by scripts/tree_gen.py.

/////////////////////////////////////////////////////////////////////////
// CSS specific types:
/////////////////////////////////////////////////////////////////////////

class Identifier extends ASTNode {
  String name;

  Identifier(this.name, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitIdentifier(this);

  String toString() => name;
}

class StringValue extends ASTNode {
  String value;

  StringValue(this.value, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitStringValue(this);

  String toString() => value;
}

// CDO/CDC (Comment Definition Open <!-- and Comment Definition Close -->).
class CommentDefinition extends ASTNode {
  String comment;

  CommentDefinition(this.comment, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitCommentDefinition(this);

  String toString() => '<!-- ${comment} -->';
}

class Template extends ASTNode {
  TemplateSignature signature;
  TemplateContent content;

  Template(this.signature, this.content, SourceSpan span):
      super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplate(this);

  String toString() => "${signature.toString()} \r{\r${content.toString()}\r}\r";
}

class TemplateSignature extends ASTNode {
  String name;
  List<Map<Identifier, Identifier>> params;   // Map of {type:, name:}

  TemplateSignature(this.name, this.params, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateSignature(this);

  String paramsAsString() {
    StringBuffer buff = new StringBuffer();
    bool first = true;
    for (final param in params) {
      if (!first) {
        buff.add(", ");
      }
      if (param['type'] != null) {
        buff.add(param['type']);
        buff.add(' ');
      }
      buff.add(param['name']);
      first = false;
    }

    return buff.toString();
  }

  String toString() => "template ${name}(${paramsAsString()})";
}

class TemplateChildren extends ASTNode {
  List<ASTNode> children;

  TemplateChildren(this.children, SourceSpan span): super(span);
  TemplateChildren.empty(SourceSpan span): children = [], super(span);

  add(var child) {
    if (children == null) {
      children = new List<ASTNode>();
    }
    children.add(child);
  }

  ASTNode last() => children.last();
  ASTNode removeLast() => children.removeLast();
  bool get anyChildren => children != null && children.length > 0;

  visit(TreeVisitor visitor) => visitor.visitTemplateChildren(this);

  String toString() {
    StringBuffer buff = new StringBuffer();
    if (children != null) {
      for (final child in children) {
        buff.add(child.toString());
      }
    }

    return buff.toString();
  }
}

class TemplateGetter extends ASTNode {
  String name;
  List<Map<Identifier, Identifier>> params;
  TemplateDocument docFrag;

  TemplateGetter(this.name, this.params, this.docFrag, SourceSpan span) :
      super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateGetter(this);

  String paramsAsString() {
    StringBuffer buff = new StringBuffer();
    bool first = true;
    for (final param in params) {
      if (!first) {
        buff.add(", ");
      }
      if (param['type'] != null && param['type'].length > 0) {
        buff.add(param['type']);
        buff.add(' ');
      }
      buff.add(param['name']);
      first = false;
    }

    return buff.toString();
  }

  String getterSignatureAsString() => "${name}(${paramsAsString()})";
}

class TemplateContent extends ASTNode {
  css.Stylesheet css;
  TemplateDocument html;
  List<TemplateGetter> getters;

  TemplateContent(this.css, this.html, this.getters, SourceSpan span) :
      super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateContent(this);
}

class TemplateDocument extends TemplateChildren {
  TemplateDocument(List<ASTNode> children, SourceSpan span):
    super(children, span);

  visit(TreeVisitor visitor) => visitor.visitTemplateDocument(this);
}

class TemplateElement extends TemplateChildren {
  int tagTokenId;
  List<TemplateAttribute> attributes;
  StringValue _varName;

  TemplateElement(this.tagTokenId, SourceSpan span): super.empty(span);
  TemplateElement.fragment(SourceSpan span) : super.empty(span), tagTokenId = -1;
  TemplateElement.attributes(this.tagTokenId, this.attributes, this._varName,
    SourceSpan span): super.empty(span);

  bool get isFragment => tagTokenId == -1;
  bool get anyAttributes => attributes != null;

  visit(TreeVisitor visitor) => visitor.visitTemplateElement(this);

  bool get hasVar => _varName != null;
  String get varName => hasVar ? _varName.value : null;

  String attributesToString() {
    StringBuffer buff = new StringBuffer();

    if (attributes != null) {
      for (final attr in attributes) {
        buff.add(' ${attr.toString()}');
      }
    }

    return buff.toString();
  }

  String get tagName => isFragment ?
    'root' : TokenKind.tagNameFromTokenId(tagTokenId);

  bool get scoped => !TokenKind.unscopedTag(tagTokenId);

  String tagStartToString() => "<${tagName}${attributesToString()}>";

  String tagEndToString() => "</${tagName}>";

  String toString() {
    StringBuffer buff = new StringBuffer(tagStartToString());

    if (children != null) {
      for (final child in children) {
        buff.add(child.toString());
      }

      buff.add(tagEndToString());
    }

    return buff.toString();
  }
}

class TemplateAttribute extends ASTNode {
  String name;
  String value;

  TemplateAttribute(this.name, this.value, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateAttribute(this);

  String toString() => "${name}=\"${value}\"";
}

class TemplateText extends ASTNode {
  String value;

  TemplateText(this.value, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateText(this);

  String toString() => value;
}

class TemplateExpression extends ASTNode {
  String expression;

  TemplateExpression(this.expression, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateExpression(this);

  String toString() => "\$\{${expression}}";
}

class TemplateEachCommand extends ASTNode {
  String listName;
  String loopItem;
  TemplateDocument documentFragment;

  TemplateEachCommand(this.listName, this.loopItem, this.documentFragment,
      SourceSpan span): super(span);

  bool get hasLoopItem => loopItem != null;
  String get loopNameOptional => hasLoopItem ? " ${loopItem}" : "";

  visit(TreeVisitor visitor) => visitor.visitTemplateEachCommand(this);

  String toString() => "\$\{#each ${listName}${loopNameOptional}}";
}

class TemplateWithCommand extends ASTNode {
  String objectName;
  String blockItem;
  TemplateDocument documentFragment;

  TemplateWithCommand(this.objectName, this.blockItem, this.documentFragment,
      SourceSpan span): super(span);

  bool get hasBlockItem => blockItem != null;
  String get blockNameOptional => hasBlockItem ? " ${blockItem}" : "";

  visit(TreeVisitor visitor) => visitor.visitTemplateWithCommand(this);

  String toString() => "\$\{#with ${objectName}${blockNameOptional}}";
}

class TemplateCall extends ASTNode {
  String toCall;
  String params;

  TemplateCall(this.toCall, this.params, SourceSpan span): super(span);

  visit(TreeVisitor visitor) => visitor.visitTemplateCall(this);

  String toString() => "\$\{#${toCall}${params}}";
}

interface TreeVisitor {
  void visitIdentifier(Identifier node);
  void visitStringValue(StringValue node);
  void visitCommentDefinition(CommentDefinition node);
  void visitTemplate(Template node);
  void visitTemplateSignature(TemplateSignature node);
  void visitTemplateChildren(TemplateChildren node);
  void visitTemplateDocument(TemplateDocument node);
  void visitTemplateContent(TemplateContent node);
  void visitTemplateElement(TemplateElement node);
  void visitTemplateAttribute(TemplateAttribute node);
  void visitTemplateText(TemplateText node);
  void visitTemplateExpression(TemplateExpression node);
  void visitTemplateEachCommand(TemplateEachCommand node);
  void visitTemplateWithCommand(TemplateWithCommand node);
  void visitTemplateCall(TemplateCall node);
  void visitTemplateGetter(TemplateGetter node);
}

class TreePrinter implements TreeVisitor {
  var output;
  TreePrinter(this.output) { output.printer = this; }

  void visitIdentifier(Identifier node) {
    output.heading('Identifier(${output.toValue(node.name)})', node.span);
  }

  void visitStringValue(StringValue node) {
    output.heading('"${output.toValue(node.value)}"', node.span);
  }

  void visitCommentDefinition(CommentDefinition node) {
    output.heading('CommentDefinition (CDO/CDC)', node.span);
    output.depth++;
    output.writeValue('comment value', node.comment);
    output.depth--;
  }

  void visitTemplate(Template node) {
    output.heading('Template', node.span);
    output.depth++;
    visitTemplateSignature(node.signature);
    visitTemplateContent(node.content);
    output.depth--;
  }

  void visitTemplateSignature(TemplateSignature node) {
    output.heading('TemplateSignature', node.span);
    output.depth++;
    output.writeValue('Template', node);
    output.depth--;
  }

  void visitTemplateChildren(TemplateChildren node) {
    output.writeNodeList('children', node.children);
  }

  void visitTemplateContent(TemplateContent node) {
    visitTemplateDocument(node.html);
    if (node.css != null) {
      output.depth++;
      output.writeValue('---CSS---', node.css.toString());
      output.depth--;
    }
    if (node.getters != null) {
      output.depth++;
      output.writeNodeList('---GETTERS---', node.getters);
      output.depth--;
    }
  }

  void visitTemplateDocument(TemplateDocument node) {
    output.heading('Content', node.span);
    output.depth++;
    // TODO(terry): Ugly use of 'as Dynamic' instead of children[0] to
    //              surpress warning.
    assert(node.children.length == 1 &&
        (node.children as Dynamic)[0].tagTokenId == -1);
    output.writeNodeList("document", node.children);
    output.depth--;
  }

  void visitTemplateElement(TemplateElement node) {
    output.heading('Element', node.span);
    output.depth++;
    output.writeValue('tag', node.tagName);
    if (node.attributes != null && (node.attributes.length > 0)) {
      output.writeNodeList("attributes", node.attributes);
    }
    visitTemplateChildren(node);
    output.depth--;
  }

  void visitTemplateAttribute(TemplateAttribute node) {
    output.heading('Attribute', node.span);
    output.depth++;
    output.writeValue('name', node.name);
    output.writeValue('value', node.value);
    output.depth--;
  }

  void visitTemplateText(TemplateText node) {
    output.heading('Text', node.span);
    output.writeValue('value', node.value);
  }

  void visitTemplateExpression(TemplateExpression node) {
    output.heading('Interpolate', node.span);
    output.writeValue('expression', "\$\{${node.expression}\}");
  }

  void visitTemplateEachCommand(TemplateEachCommand node) {
    output.heading('#each', node.span);
    output.writeValue('list', node.listName);
    visitTemplateDocument(node.documentFragment);
  }

  void visitTemplateWithCommand(TemplateWithCommand node) {
    output.heading('#with', node.span);
    output.writeValue('object', node.objectName);
    visitTemplateDocument(node.documentFragment);
  }

  void visitTemplateCall(TemplateCall node) {
    output.heading('#call template', node.span);
    output.writeValue('templateToCall', node.toCall);
    output.writeValue('params', node.params);
  }

  void visitTemplateGetter(TemplateGetter node) {
    output.heading('template getter', node.span);
    output.writeValue('getter Signature', node.getterSignatureAsString());
    visitTemplateDocument(node.docFrag);
  }
}


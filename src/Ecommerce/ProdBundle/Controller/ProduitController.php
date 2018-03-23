<?php

namespace Ecommerce\ProdBundle\Controller;
use AppBundle\Entity\Produit;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class ProduitController extends Controller
{
    /**
     * @Route("/produits",name="produit_list")
     */
    public function indexAction()
    {
		$prod=$this->getDoctrine()
		->getRepository('AppBundle:Produit')
		->findAll();
        return $this->render('EcommerceProdBundle:Produit:index.html.twig',array(
		'produit' => $prod
		));
    }
	/**
     * @Route("/Ajoutproduit",name="produit_ajout")
     */
	public function AjoutAction(Request $request)
    {
		$prod=new produit;
		$form=$this->createFormBuilder($prod)

->add('Libelle',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Prix',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Description',textareaType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Categorie',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Ajouter',SubmitType::class,array('label'=>'Ajouter','attr'=>array('class'=>'btn btn-primary','style'=>'margin=button:15px')))		

	 ->getForm();
    $form->handleRequest($request);
	if ($form->isSubmitted() && $form->isValid()) {
		$lbl=$form['Libelle']->getData();
		$prx=$form['Prix']->getData();
		$Desc=$form['Description']->getData();
		$Cat=$form['Categorie']->getData();
		$prod->setLibelle($lbl);
		$prod->setPrix($prx);
		$prod->setDescription($Desc);
		$prod->setCategorie($Cat);
		$res=$this->getDoctrine()->getManager();
		$res->persist($prod);
		$res->flush();
		
		$this->addFlash('notice','Produit ajouté');
        return $this->redirect('http://localhost/ProjetS2/web/app_dev.php/produits');		
	}
		return $this->render('EcommerceProdBundle:Produit:ajout.html.twig',array(
		'form'=>$form->createView()
		));
		
    }
	/**
     * @Route("/Supproduit",name="produit_supp")
     */
	public function SuppAction()
    {
        return $this->render('EcommerceProdBundle:Produit:supp.html.twig');
    }
	/**
     * @Route("/Modproduit",name="produit_Mod")
     */
	public function ModifAction($id,Request $request)
    {
		$prod=$this->getDoctrine()
		->getRepository('AppBundle:Produit')
		->find($id);
        $prod->setLibelle($prod->getLibelle());
		$prod->setPrix($prod->getPrix());
		$prod->setDescription($prod->getDescription());
		$prod->setCategorie($prod->getCategorie());
		$form=$this->createFormBuilder($prod)

->add('Libelle',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Prix',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Description',textareaType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Categorie',textType::class,array('attr'=>array('class'=>'form=control','style'=>'margin=button:15px')))		
->add('Ajouter',SubmitType::class,array('label'=>'Ajouter','attr'=>array('class'=>'btn btn-primary','style'=>'margin=button:15px')))		

	 ->getForm();
    $form->handleRequest($request);
	if ($form->isSubmitted() && $form->isValid()) {
		$lbl=$form['Libelle']->getData();
		$prx=$form['Prix']->getData();
		$Desc=$form['Description']->getData();
		$Cat=$form['Categorie']->getData();
		
		$res=$this->getDoctrine()->getManager();
		$prod=$res->getRepository(AppBundle:Produit)->find('$id');
		$prod->setLibelle($lbl);
		$prod->setPrix($prx);
		$prod->setDescription($Desc);
		$prod->setCategorie($Cat);

		$res->flush();
		
		$this->addFlash('notice','Produit modifer');
        return $this->redirect('http://localhost/ProjetS2/web/app_dev.php/produits');		
	}
		
        return $this->render('EcommerceProdBundle:Produit:modif.html.twig',array(
		'produit' => $prod,
		'form'=>$from->createView()
		));
	
    }
	/**
     * @Route("/Detailproduit",name="produit_detail")
     */
	public function DetailAction($id)
    {

	$prod = $this->getDoctrine()
                ->getRepository('ProduitBundle:prod')
                ->find($id);
        if (empty($prod)) {
            $this->addFlash('error', 'produit not found');
            
            return $this->redirectToRoute('produits_list');
        }
        
        return $this->render('ProduitBundle:Produit:details.html.twig', array(
            'prod' => $prod
        ));
    }
}

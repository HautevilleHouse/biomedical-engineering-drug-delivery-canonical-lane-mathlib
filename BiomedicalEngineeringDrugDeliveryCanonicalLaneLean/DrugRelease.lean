import HautevilleHouse.BiomedicalEngineeringDrugDeliveryCanonicalLaneLean.Pharmacokinetics

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure DrugReleasePackage {C : CompartmentModelPackage}
    (P : PharmacokineticsPackage C) where
  releaseKinetics : Type
  diffusionCoefficient : ℝ
  degradationRate : ℝ
  zeroOrderRelease : Prop
  firstOrderRelease : Prop
  releaseRateControlled : Prop

structure DrugReleaseEvidence {C : CompartmentModelPackage}
    {P : PharmacokineticsPackage C} (R : DrugReleasePackage P) where
  zeroOrderReleaseClosed : R.zeroOrderRelease
  firstOrderReleaseClosed : R.firstOrderRelease
  releaseRateControlledClosed : R.releaseRateControlled

def DrugReleaseClosed {C : CompartmentModelPackage}
    {P : PharmacokineticsPackage C} (R : DrugReleasePackage P) : Prop :=
  R.zeroOrderRelease ∧ R.firstOrderRelease ∧ R.releaseRateControlled

theorem drug_release_closed_from_evidence
    {C : CompartmentModelPackage} {P : PharmacokineticsPackage C}
    (R : DrugReleasePackage P) (E : DrugReleaseEvidence R) :
    DrugReleaseClosed R := by
  exact And.intro E.zeroOrderReleaseClosed
    (And.intro E.firstOrderReleaseClosed E.releaseRateControlledClosed)

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse